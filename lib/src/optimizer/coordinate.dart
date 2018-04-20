import 'package:dart_ml/src/optimizer/initial_weights_generator/initial_weights_generator.dart';
import 'package:dart_ml/src/optimizer/optimizer.dart';
import 'package:simd_vector/vector.dart';

class CoordinateOptimizer implements Optimizer {
  final InitialWeightsGenerator _initialCoefficientsGenerator;

  //hyper parameters declaration
  final double _coefficientsDiffThreshold;
  final int _iterationLimit;
  final double _lambda;
  //hyper parameters declaration end

  CoordinateOptimizer(
    this._initialCoefficientsGenerator,
    {
      double minCoefficientsDiff,
      int iterationLimit,
      double lambda
    }
  ) :
    _coefficientsDiffThreshold = minCoefficientsDiff ?? 1e-8,
    _iterationLimit = iterationLimit ?? 10000,
    _lambda = lambda ?? 0.0;

  @override
  Float32x4Vector findExtrema(
    covariant List<Float32x4Vector> points,
    covariant List<double> labels,
    {
      covariant Float32x4Vector initialWeights,
      bool isMinimizingObjective = true
    }
  ) {
    Float32x4Vector coefficients = initialWeights ?? _initialCoefficientsGenerator.generate(points.first.length);

    double coefficientsDiff = double.INFINITY;
    int iteration = 0;

    while (coefficientsDiff > _coefficientsDiffThreshold && iteration < _iterationLimit) {
      final updatedCoefficients = new List<double>.filled(coefficients.length, 0.0, growable: false);

      for (int j = 0; j < coefficients.length; j++) {
        final coefficientsAsList = coefficients.asList();
        coefficientsAsList[j] = 0.0;
        final coefficientsWithoutJ = new Float32x4Vector.from(coefficientsAsList);

        for (int i = 0; i < points.length; i++) {
          final pointAsList = points[i].asList();
          final x = pointAsList[j];
          final y = labels[i];

          pointAsList[j] = 0.0;

          final pointWithoutJ = new Float32x4Vector.from(pointAsList);
          final yHat = coefficientsWithoutJ.dot(pointWithoutJ);

          updatedCoefficients[j] += x * (y - yHat);
        }
      }

      final regularizedCoefficients = _regularize(updatedCoefficients, _lambda);
      final newCoefficients = new Float32x4Vector.from(regularizedCoefficients);

      coefficientsDiff = newCoefficients.distanceTo(coefficients);
      coefficients = newCoefficients;

      iteration++;
    }

    return coefficients;
  }

  List<double> _regularize(List<double> coefficients, double lambda) {
    if (lambda == 0.0) {
      return coefficients;
    }

    final regularized = new List<double>.filled(coefficients.length, 0.0, growable: false);

    for (int i = 0; i < coefficients.length; i++) {
      double coefficient = coefficients[i];
      double delta = lambda / 2;

      if (coefficient > delta) {
        coefficient -= delta;
      } else if (coefficient < -delta) {
        coefficient += delta;
      } else {
        coefficient = 0.0;
      }

      regularized[i] = coefficient;
     }

     return regularized;
  }
}