import 'package:ml_algo/src/cost_function/cost_function.dart';
import 'package:ml_algo/src/cost_function/cost_function_factory.dart';
import 'package:ml_algo/src/cost_function/cost_function_factory_impl.dart';
import 'package:ml_algo/src/cost_function/cost_function_type.dart';
import 'package:ml_algo/src/default_parameter_values.dart';
import 'package:ml_algo/src/math/randomizer/randomizer.dart';
import 'package:ml_algo/src/math/randomizer/randomizer_factory.dart';
import 'package:ml_algo/src/math/randomizer/randomizer_factory_impl.dart';
import 'package:ml_algo/src/optimizer/gradient/learning_rate_generator/learning_rate_generator.dart';
import 'package:ml_algo/src/optimizer/gradient/learning_rate_generator/learning_rate_generator_factory.dart';
import 'package:ml_algo/src/optimizer/gradient/learning_rate_generator/learning_rate_generator_factory_impl.dart';
import 'package:ml_algo/src/optimizer/gradient/learning_rate_generator/learning_rate_type.dart';
import 'package:ml_algo/src/optimizer/initial_weights_generator/initial_weights_generator.dart';
import 'package:ml_algo/src/optimizer/initial_weights_generator/initial_weights_generator_factory.dart';
import 'package:ml_algo/src/optimizer/initial_weights_generator/initial_weights_generator_factory_impl.dart';
import 'package:ml_algo/src/optimizer/initial_weights_generator/initial_weights_type.dart';
import 'package:ml_algo/src/optimizer/optimizer.dart';
import 'package:ml_algo/src/score_to_prob_mapper/score_to_prob_mapper_type.dart';
import 'package:ml_linalg/matrix.dart';
import 'package:ml_linalg/range.dart';
import 'package:ml_linalg/vector.dart';

class GradientOptimizer implements Optimizer {
  final Randomizer _randomizer;
  final CostFunction _costFunction;
  final LearningRateGenerator _learningRateGenerator;
  final InitialWeightsGenerator _initialWeightsGenerator;
  final Type _dtype;

  //hyper parameters declaration
  final double _minCoefficientsUpdate;
  final int _iterationLimit;
  final double _lambda;
  final int _batchSize;
  //hyper parameters declaration end

  MLMatrix _points;
  MLMatrix _coefficients;

  GradientOptimizer({
    Type dtype = DefaultParameterValues.dtype,
    RandomizerFactory randomizerFactory = const RandomizerFactoryImpl(),
    CostFunctionFactory costFunctionFactory = const CostFunctionFactoryImpl(),
    LearningRateGeneratorFactory learningRateGeneratorFactory =
        const LearningRateGeneratorFactoryImpl(),
    InitialWeightsGeneratorFactory initialWeightsGeneratorFactory =
        const InitialWeightsGeneratorFactoryImpl(),
    CostFunctionType costFnType,
    LearningRateType learningRateType,
    InitialWeightsType initialWeightsType,
    ScoreToProbMapperType scoreToProbMapperType,
    double initialLearningRate = DefaultParameterValues.initialLearningRate,
    double minCoefficientsUpdate = DefaultParameterValues.minCoefficientsUpdate,
    int iterationLimit = DefaultParameterValues.iterationsLimit,
    double lambda,
    int batchSize,
    int randomSeed,
  })  : _minCoefficientsUpdate = minCoefficientsUpdate,
        _iterationLimit = iterationLimit,
        _lambda = lambda ?? 0.0,
        _batchSize = batchSize,
        _initialWeightsGenerator =
            initialWeightsGeneratorFactory.fromType(initialWeightsType, dtype),
        _learningRateGenerator =
            learningRateGeneratorFactory.fromType(learningRateType),
        _costFunction = costFunctionFactory.fromType(costFnType,
            dtype: dtype, scoreToProbMapperType: scoreToProbMapperType),
        _dtype = dtype,
        _randomizer = randomizerFactory.create(randomSeed) {
    _learningRateGenerator.init(initialLearningRate ?? 1.0);
  }

  @override
  MLMatrix findExtrema(MLMatrix points, MLVector labels,
      {int numOfCoefficientVectors = 1,
      MLMatrix initialWeights,
      bool isMinimizingObjective = true,
      bool arePointsNormalized = false}) {
    _points = points;

    final batchSize =
        _batchSize >= _points.rowsNum ? _points.rowsNum : _batchSize;

    _coefficients = initialWeights ??
        MLMatrix.rows(List<MLVector>.generate(numOfCoefficientVectors,
            (int i) => _initialWeightsGenerator.generate(_points.columnsNum)));

    var coefficientsUpdate = double.maxFinite;
    var iterationCounter = 0;
    final coefficientsSource = List<MLVector>(numOfCoefficientVectors);

    while (!_isConverged(coefficientsUpdate, iterationCounter)) {
      for (int k = 0; k < numOfCoefficientVectors; k++) {
        final eta = _learningRateGenerator.getNextValue();
        final coefficients = _coefficients.getRow(k);
        final newCoefficients = _generateCoefficients(
            coefficients, labels, eta, batchSize,
            isMinimization: isMinimizingObjective);
        coefficientsUpdate = newCoefficients.distanceTo(coefficients);
        coefficientsSource[k] = newCoefficients;
        iterationCounter++;
      }
      // TODO: get rid of matrix instantiating here, use a list
      _coefficients = MLMatrix.rows(coefficientsSource, dtype: _dtype);
    }

    _learningRateGenerator.stop();

    return _coefficients;
  }

  bool _isConverged(double coefficientsUpdate, int iterationCounter) =>
      (_minCoefficientsUpdate != null
          ? coefficientsUpdate <= _minCoefficientsUpdate
          : false) ||
      (iterationCounter >= _iterationLimit);

  MLVector _generateCoefficients(
      MLVector currentCoefficients, MLVector labels, double eta, int batchSize,
      {bool isMinimization = true}) {
    final range = _getBatchRange(batchSize);
    final start = range.first;
    final end = range.last;
    final pointsBatch = _points.submatrix(rows: Range(start, end));
    final labelsBatch = labels.subvector(start, end);

    return _makeGradientStep(currentCoefficients, pointsBatch, labelsBatch, eta,
        isMinimization: isMinimization);
  }

  Iterable<int> _getBatchRange(int batchSize) => _randomizer
      .getIntegerInterval(0, _points.rowsNum, intervalLength: batchSize);

  MLVector _makeGradientStep(
      MLVector coefficients, MLMatrix points, MLVector labels, double eta,
      {bool isMinimization = true}) {
    final gradient = _costFunction.getGradient(points, coefficients, labels);
    final regularizedCoefficients = _regularize(eta, _lambda, coefficients);
    return isMinimization
        ? regularizedCoefficients - gradient * eta
        : regularizedCoefficients + gradient * eta;
  }

  MLVector _regularize(double eta, double lambda, MLVector coefficients) {
    if (lambda == 0) {
      return coefficients;
    } else {
      return coefficients * (1 - 2 * eta * lambda);
    }
  }
}
