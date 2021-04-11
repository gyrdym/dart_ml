// Mocks generated by Mockito 5.0.3 from annotations
// in ml_algo/test/mocks.dart.
// Do not manually edit this file.

import 'dart:collection' as _i13;

import 'package:ml_algo/src/classifier/classifier.dart' as _i46;
import 'package:ml_algo/src/classifier/decision_tree_classifier/decision_tree_classifier.dart'
    as _i11;
import 'package:ml_algo/src/classifier/decision_tree_classifier/decision_tree_classifier_factory.dart'
    as _i35;
import 'package:ml_algo/src/classifier/knn_classifier/knn_classifier.dart'
    as _i20;
import 'package:ml_algo/src/classifier/knn_classifier/knn_classifier_factory.dart'
    as _i52;
import 'package:ml_algo/src/common/distribution_calculator/distribution_calculator.dart'
    as _i14;
import 'package:ml_algo/src/common/distribution_calculator/distribution_calculator_factory.dart'
    as _i40;
import 'package:ml_algo/src/cost_function/cost_function.dart' as _i10;
import 'package:ml_algo/src/cost_function/cost_function_factory.dart' as _i32;
import 'package:ml_algo/src/cost_function/cost_function_type.dart' as _i33;
import 'package:ml_algo/src/knn_kernel/kernel.dart' as _i19;
import 'package:ml_algo/src/knn_kernel/kernel_factory.dart' as _i51;
import 'package:ml_algo/src/knn_kernel/kernel_type.dart' as _i50;
import 'package:ml_algo/src/knn_solver/knn_solver.dart' as _i18;
import 'package:ml_algo/src/knn_solver/knn_solver_factory.dart' as _i49;
import 'package:ml_algo/src/knn_solver/neigbour.dart' as _i48;
import 'package:ml_algo/src/linear_optimizer/convergence_detector/convergence_detector.dart'
    as _i39;
import 'package:ml_algo/src/linear_optimizer/gradient_optimizer/learning_rate_generator/learning_rate_generator.dart'
    as _i15;
import 'package:ml_algo/src/linear_optimizer/gradient_optimizer/learning_rate_generator/learning_rate_generator_factory.dart'
    as _i41;
import 'package:ml_algo/src/linear_optimizer/gradient_optimizer/learning_rate_generator/learning_rate_type.dart'
    as _i42;
import 'package:ml_algo/src/linear_optimizer/initial_coefficients_generator/initial_coefficients_generator.dart'
    as _i12;
import 'package:ml_algo/src/linear_optimizer/initial_coefficients_generator/initial_coefficients_generator_factory.dart'
    as _i37;
import 'package:ml_algo/src/linear_optimizer/initial_coefficients_generator/initial_coefficients_type.dart'
    as _i38;
import 'package:ml_algo/src/link_function/link_function.dart' as _i34;
import 'package:ml_algo/src/math/randomizer/randomizer.dart' as _i7;
import 'package:ml_algo/src/math/randomizer/randomizer_factory.dart' as _i31;
import 'package:ml_algo/src/metric/metric.dart' as _i6;
import 'package:ml_algo/src/metric/metric_factory.dart' as _i29;
import 'package:ml_algo/src/metric/metric_type.dart' as _i30;
import 'package:ml_algo/src/model_selection/model_assessor/classifier_assessor.dart'
    as _i45;
import 'package:ml_algo/src/tree_trainer/leaf_detector/leaf_detector.dart'
    as _i17;
import 'package:ml_algo/src/tree_trainer/leaf_detector/leaf_detector_factory.dart'
    as _i44;
import 'package:ml_algo/src/tree_trainer/leaf_label/leaf_label.dart' as _i16;
import 'package:ml_algo/src/tree_trainer/leaf_label/leaf_label_factory.dart'
    as _i43;
import 'package:ml_algo/src/tree_trainer/split_assessor/split_assessor.dart'
    as _i4;
import 'package:ml_algo/src/tree_trainer/split_assessor/split_assessor_factory.dart'
    as _i24;
import 'package:ml_algo/src/tree_trainer/split_assessor/split_assessor_type.dart'
    as _i25;
import 'package:ml_algo/src/tree_trainer/splitter/nominal_splitter/nominal_splitter.dart'
    as _i3;
import 'package:ml_algo/src/tree_trainer/splitter/nominal_splitter/nominal_splitter_factory.dart'
    as _i23;
import 'package:ml_algo/src/tree_trainer/splitter/numerical_splitter/numerical_splitter.dart'
    as _i2;
import 'package:ml_algo/src/tree_trainer/splitter/numerical_splitter/numerical_splitter_factory.dart'
    as _i22;
import 'package:ml_algo/src/tree_trainer/splitter/splitter.dart' as _i5;
import 'package:ml_algo/src/tree_trainer/splitter/splitter_factory.dart'
    as _i27;
import 'package:ml_algo/src/tree_trainer/splitter/splitter_type.dart' as _i28;
import 'package:ml_algo/src/tree_trainer/tree_node/tree_node.dart' as _i26;
import 'package:ml_dataframe/src/data_frame/data_frame.dart' as _i21;
import 'package:ml_linalg/distance.dart' as _i47;
import 'package:ml_linalg/dtype.dart' as _i36;
import 'package:ml_linalg/matrix.dart' as _i8;
import 'package:ml_linalg/vector.dart' as _i9;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeNumericalTreeSplitter extends _i1.Fake
    implements _i2.NumericalTreeSplitter {}

class _FakeNominalTreeSplitter extends _i1.Fake
    implements _i3.NominalTreeSplitter {}

class _FakeTreeSplitAssessor extends _i1.Fake implements _i4.TreeSplitAssessor {
}

class _FakeTreeSplitter extends _i1.Fake implements _i5.TreeSplitter {}

class _FakeMetric extends _i1.Fake implements _i6.Metric {}

class _FakeRandomizer extends _i1.Fake implements _i7.Randomizer {}

class _FakeMatrix extends _i1.Fake implements _i8.Matrix {}

class _FakeVector extends _i1.Fake implements _i9.Vector {}

class _FakeCostFunction extends _i1.Fake implements _i10.CostFunction {}

class _FakeDecisionTreeClassifier extends _i1.Fake
    implements _i11.DecisionTreeClassifier {}

class _FakeInitialCoefficientsGenerator extends _i1.Fake
    implements _i12.InitialCoefficientsGenerator {}

class _FakeHashMap<K, V> extends _i1.Fake implements _i13.HashMap<K, V> {}

class _FakeDistributionCalculator extends _i1.Fake
    implements _i14.DistributionCalculator {}

class _FakeLearningRateGenerator extends _i1.Fake
    implements _i15.LearningRateGenerator {}

class _FakeTreeLeafLabel extends _i1.Fake implements _i16.TreeLeafLabel {}

class _FakeTreeLeafDetector extends _i1.Fake implements _i17.TreeLeafDetector {}

class _FakeKnnSolver extends _i1.Fake implements _i18.KnnSolver {}

class _FakeKernel extends _i1.Fake implements _i19.Kernel {}

class _FakeKnnClassifier extends _i1.Fake implements _i20.KnnClassifier {}

class _FakeDataFrame extends _i1.Fake implements _i21.DataFrame {}

/// A class which mocks [NumericalTreeSplitterFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockNumericalTreeSplitterFactory extends _i1.Mock
    implements _i22.NumericalTreeSplitterFactory {
  MockNumericalTreeSplitterFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.NumericalTreeSplitter create() => (super.noSuchMethod(
      Invocation.method(#create, []),
      returnValue: _FakeNumericalTreeSplitter()) as _i2.NumericalTreeSplitter);
}

/// A class which mocks [NominalTreeSplitterFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockNominalTreeSplitterFactory extends _i1.Mock
    implements _i23.NominalTreeSplitterFactory {
  MockNominalTreeSplitterFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.NominalTreeSplitter create() =>
      (super.noSuchMethod(Invocation.method(#create, []),
          returnValue: _FakeNominalTreeSplitter()) as _i3.NominalTreeSplitter);
}

/// A class which mocks [TreeSplitAssessor].
///
/// See the documentation for Mockito's code generation for more information.
class MockTreeSplitAssessor extends _i1.Mock implements _i4.TreeSplitAssessor {
  MockTreeSplitAssessor() {
    _i1.throwOnMissingStub(this);
  }

  @override
  double getAggregatedError(
          Iterable<_i8.Matrix>? splitObservations, int? targetId) =>
      (super.noSuchMethod(
          Invocation.method(#getAggregatedError, [splitObservations, targetId]),
          returnValue: 0.0) as double);
  @override
  double getError(_i8.Matrix? splitObservations, int? targetId) => (super
      .noSuchMethod(Invocation.method(#getError, [splitObservations, targetId]),
          returnValue: 0.0) as double);
}

/// A class which mocks [TreeSplitAssessorFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockTreeSplitAssessorFactory extends _i1.Mock
    implements _i24.TreeSplitAssessorFactory {
  MockTreeSplitAssessorFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.TreeSplitAssessor createByType(_i25.TreeSplitAssessorType? type) =>
      (super.noSuchMethod(Invocation.method(#createByType, [type]),
          returnValue: _FakeTreeSplitAssessor()) as _i4.TreeSplitAssessor);
}

/// A class which mocks [NumericalTreeSplitter].
///
/// See the documentation for Mockito's code generation for more information.
class MockNumericalTreeSplitter extends _i1.Mock
    implements _i2.NumericalTreeSplitter {
  MockNumericalTreeSplitter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Map<_i26.TreeNode, _i8.Matrix> split(
          _i8.Matrix? samples, int? splittingIdx, double? splittingValue) =>
      (super.noSuchMethod(
          Invocation.method(#split, [samples, splittingIdx, splittingValue]),
          returnValue: <_i26.TreeNode,
              _i8.Matrix>{}) as Map<_i26.TreeNode, _i8.Matrix>);
}

/// A class which mocks [NominalTreeSplitter].
///
/// See the documentation for Mockito's code generation for more information.
class MockNominalTreeSplitter extends _i1.Mock
    implements _i3.NominalTreeSplitter {
  MockNominalTreeSplitter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Map<_i26.TreeNode, _i8.Matrix> split(
          _i8.Matrix? samples, int? splittingIdx, List<num>? uniqueValues) =>
      (super.noSuchMethod(
              Invocation.method(#split, [samples, splittingIdx, uniqueValues]),
              returnValue: <_i26.TreeNode, _i8.Matrix>{})
          as Map<_i26.TreeNode, _i8.Matrix>);
}

/// A class which mocks [TreeSplitter].
///
/// See the documentation for Mockito's code generation for more information.
class MockTreeSplitter extends _i1.Mock implements _i5.TreeSplitter {
  MockTreeSplitter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Map<_i26.TreeNode, _i8.Matrix> split(
          _i8.Matrix? samples, int? splittingIdx, int? targetId,
          [List<num>? uniqueValues]) =>
      (super.noSuchMethod(
              Invocation.method(
                  #split, [samples, splittingIdx, targetId, uniqueValues]),
              returnValue: <_i26.TreeNode, _i8.Matrix>{})
          as Map<_i26.TreeNode, _i8.Matrix>);
}

/// A class which mocks [TreeSplitterFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockTreeSplitterFactory extends _i1.Mock
    implements _i27.TreeSplitterFactory {
  MockTreeSplitterFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.TreeSplitter createByType(_i28.TreeSplitterType? type,
          _i25.TreeSplitAssessorType? assessorType) =>
      (super.noSuchMethod(
          Invocation.method(#createByType, [type, assessorType]),
          returnValue: _FakeTreeSplitter()) as _i5.TreeSplitter);
}

/// A class which mocks [MetricFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockMetricFactory extends _i1.Mock implements _i29.MetricFactory {
  MockMetricFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Metric createByType(_i30.MetricType? metricType) =>
      (super.noSuchMethod(Invocation.method(#createByType, [metricType]),
          returnValue: _FakeMetric()) as _i6.Metric);
}

/// A class which mocks [Metric].
///
/// See the documentation for Mockito's code generation for more information.
class MockMetric extends _i1.Mock implements _i6.Metric {
  MockMetric() {
    _i1.throwOnMissingStub(this);
  }

  @override
  double getScore(_i8.Matrix? predictedLabels, _i8.Matrix? origLabels) => (super
      .noSuchMethod(Invocation.method(#getScore, [predictedLabels, origLabels]),
          returnValue: 0.0) as double);
}

/// A class which mocks [RandomizerFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockRandomizerFactory extends _i1.Mock implements _i31.RandomizerFactory {
  MockRandomizerFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Randomizer create([int? seed]) =>
      (super.noSuchMethod(Invocation.method(#create, [seed]),
          returnValue: _FakeRandomizer()) as _i7.Randomizer);
}

/// A class which mocks [Randomizer].
///
/// See the documentation for Mockito's code generation for more information.
class MockRandomizer extends _i1.Mock implements _i7.Randomizer {
  MockRandomizer() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Iterable<int> getIntegerInterval(int? lowerBound, int? upperBound,
          {int? intervalLength}) =>
      (super.noSuchMethod(
          Invocation.method(#getIntegerInterval, [lowerBound, upperBound],
              {#intervalLength: intervalLength}),
          returnValue: []) as Iterable<int>);
  @override
  Iterable<double> getDoubleInterval(double? lowerBound, double? upperBound) =>
      (super.noSuchMethod(
          Invocation.method(#getDoubleInterval, [lowerBound, upperBound]),
          returnValue: []) as Iterable<double>);
  @override
  int getIntegerFromInterval(int? start, int? end) => (super.noSuchMethod(
      Invocation.method(#getIntegerFromInterval, [start, end]),
      returnValue: 0) as int);
  @override
  double getDoubleFromInterval(double? start, double? end) => (super
      .noSuchMethod(Invocation.method(#getDoubleFromInterval, [start, end]),
          returnValue: 0.0) as double);
}

/// A class which mocks [CostFunction].
///
/// See the documentation for Mockito's code generation for more information.
class MockCostFunction extends _i1.Mock implements _i10.CostFunction {
  MockCostFunction() {
    _i1.throwOnMissingStub(this);
  }

  @override
  double getCost(_i8.Matrix? x, _i8.Matrix? w, _i8.Matrix? y) =>
      (super.noSuchMethod(Invocation.method(#getCost, [x, w, y]),
          returnValue: 0.0) as double);
  @override
  _i8.Matrix getGradient(_i8.Matrix? x, _i8.Matrix? w, _i8.Matrix? y) =>
      (super.noSuchMethod(Invocation.method(#getGradient, [x, w, y]),
          returnValue: _FakeMatrix()) as _i8.Matrix);
  @override
  _i9.Vector getSubGradient(
          int? j, _i8.Matrix? x, _i8.Matrix? w, _i8.Matrix? y) =>
      (super.noSuchMethod(Invocation.method(#getSubGradient, [j, x, w, y]),
          returnValue: _FakeVector()) as _i9.Vector);
}

/// A class which mocks [CostFunctionFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockCostFunctionFactory extends _i1.Mock
    implements _i32.CostFunctionFactory {
  MockCostFunctionFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i10.CostFunction createByType(_i33.CostFunctionType? type,
          {_i34.LinkFunction? linkFunction,
          num? positiveLabel,
          num? negativeLabel}) =>
      (super.noSuchMethod(
          Invocation.method(#createByType, [
            type
          ], {
            #linkFunction: linkFunction,
            #positiveLabel: positiveLabel,
            #negativeLabel: negativeLabel
          }),
          returnValue: _FakeCostFunction()) as _i10.CostFunction);
}

/// A class which mocks [DecisionTreeClassifierFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockDecisionTreeClassifierFactory extends _i1.Mock
    implements _i35.DecisionTreeClassifierFactory {
  MockDecisionTreeClassifierFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i11.DecisionTreeClassifier create(
          _i21.DataFrame? trainData,
          String? targetName,
          _i36.DType? dtype,
          num? minError,
          int? minSamplesCount,
          int? maxDepth) =>
      (super.noSuchMethod(
              Invocation.method(#create, [
                trainData,
                targetName,
                dtype,
                minError,
                minSamplesCount,
                maxDepth
              ]),
              returnValue: _FakeDecisionTreeClassifier())
          as _i11.DecisionTreeClassifier);
  @override
  _i11.DecisionTreeClassifier fromJson(String? json) =>
      (super.noSuchMethod(Invocation.method(#fromJson, [json]),
              returnValue: _FakeDecisionTreeClassifier())
          as _i11.DecisionTreeClassifier);
}

/// A class which mocks [LinkFunction].
///
/// See the documentation for Mockito's code generation for more information.
class MockLinkFunction extends _i1.Mock implements _i34.LinkFunction {
  MockLinkFunction() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Matrix link(_i8.Matrix? scoresByClasses) =>
      (super.noSuchMethod(Invocation.method(#link, [scoresByClasses]),
          returnValue: _FakeMatrix()) as _i8.Matrix);
}

/// A class which mocks [InitialCoefficientsGenerator].
///
/// See the documentation for Mockito's code generation for more information.
class MockInitialCoefficientsGenerator extends _i1.Mock
    implements _i12.InitialCoefficientsGenerator {
  MockInitialCoefficientsGenerator() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Vector generate(int? length) =>
      (super.noSuchMethod(Invocation.method(#generate, [length]),
          returnValue: _FakeVector()) as _i9.Vector);
}

/// A class which mocks [InitialCoefficientsGeneratorFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockInitialCoefficientsGeneratorFactory extends _i1.Mock
    implements _i37.InitialCoefficientsGeneratorFactory {
  MockInitialCoefficientsGeneratorFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i12.InitialCoefficientsGenerator zeroes(_i36.DType? dtype) =>
      (super.noSuchMethod(Invocation.method(#zeroes, [dtype]),
              returnValue: _FakeInitialCoefficientsGenerator())
          as _i12.InitialCoefficientsGenerator);
  @override
  _i12.InitialCoefficientsGenerator fromType(
          _i38.InitialCoefficientsType? type, _i36.DType? dtype) =>
      (super.noSuchMethod(Invocation.method(#fromType, [type, dtype]),
              returnValue: _FakeInitialCoefficientsGenerator())
          as _i12.InitialCoefficientsGenerator);
}

/// A class which mocks [ConvergenceDetector].
///
/// See the documentation for Mockito's code generation for more information.
class MockConvergenceDetector extends _i1.Mock
    implements _i39.ConvergenceDetector {
  MockConvergenceDetector() {
    _i1.throwOnMissingStub(this);
  }

  @override
  double get minDiff =>
      (super.noSuchMethod(Invocation.getter(#minDiff), returnValue: 0.0)
          as double);
  @override
  int get iterationsLimit =>
      (super.noSuchMethod(Invocation.getter(#iterationsLimit), returnValue: 0)
          as int);
  @override
  bool isConverged(double? coefficientsDiff, int? iteration) =>
      (super.noSuchMethod(
          Invocation.method(#isConverged, [coefficientsDiff, iteration]),
          returnValue: false) as bool);
}

/// A class which mocks [DistributionCalculator].
///
/// See the documentation for Mockito's code generation for more information.
class MockDistributionCalculator extends _i1.Mock
    implements _i14.DistributionCalculator {
  MockDistributionCalculator() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i13.HashMap<T, double> calculate<T>(Iterable<T>? sequence,
          [int? classLabelsLength]) =>
      (super.noSuchMethod(
          Invocation.method(#calculate, [sequence, classLabelsLength]),
          returnValue: _FakeHashMap<T, double>()) as _i13.HashMap<T, double>);
}

/// A class which mocks [DistributionCalculatorFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockDistributionCalculatorFactory extends _i1.Mock
    implements _i40.DistributionCalculatorFactory {
  MockDistributionCalculatorFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i14.DistributionCalculator create() =>
      (super.noSuchMethod(Invocation.method(#create, []),
              returnValue: _FakeDistributionCalculator())
          as _i14.DistributionCalculator);
}

/// A class which mocks [LearningRateGeneratorFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockLearningRateGeneratorFactory extends _i1.Mock
    implements _i41.LearningRateGeneratorFactory {
  MockLearningRateGeneratorFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i15.LearningRateGenerator fromType(_i42.LearningRateType? type) =>
      (super.noSuchMethod(Invocation.method(#fromType, [type]),
              returnValue: _FakeLearningRateGenerator())
          as _i15.LearningRateGenerator);
}

/// A class which mocks [TreeLeafDetector].
///
/// See the documentation for Mockito's code generation for more information.
class MockTreeLeafDetector extends _i1.Mock implements _i17.TreeLeafDetector {
  MockTreeLeafDetector() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool isLeaf(_i8.Matrix? sample, int? targetIdx,
          Iterable<int>? featureColumnIdxs, int? treeDepth) =>
      (super.noSuchMethod(
          Invocation.method(
              #isLeaf, [sample, targetIdx, featureColumnIdxs, treeDepth]),
          returnValue: false) as bool);
}

/// A class which mocks [TreeLeafLabelFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockTreeLeafLabelFactory extends _i1.Mock
    implements _i43.TreeLeafLabelFactory {
  MockTreeLeafLabelFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i16.TreeLeafLabel create(_i8.Matrix? samples, int? targetIdx) =>
      (super.noSuchMethod(Invocation.method(#create, [samples, targetIdx]),
          returnValue: _FakeTreeLeafLabel()) as _i16.TreeLeafLabel);
}

/// A class which mocks [TreeLeafDetectorFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockTreeLeafDetectorFactory extends _i1.Mock
    implements _i44.TreeLeafDetectorFactory {
  MockTreeLeafDetectorFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i17.TreeLeafDetector create(_i25.TreeSplitAssessorType? assessorType,
          num? minErrorOnNode, int? minSamplesCount, int? maxDepth) =>
      (super.noSuchMethod(
          Invocation.method(#create,
              [assessorType, minErrorOnNode, minSamplesCount, maxDepth]),
          returnValue: _FakeTreeLeafDetector()) as _i17.TreeLeafDetector);
}

/// A class which mocks [ClassifierAssessor].
///
/// See the documentation for Mockito's code generation for more information.
class MockClassifierAssessor extends _i1.Mock
    implements _i45.ClassifierAssessor {
  MockClassifierAssessor() {
    _i1.throwOnMissingStub(this);
  }

  @override
  double assess(_i46.Classifier? classifier, _i30.MetricType? metricType,
          _i21.DataFrame? samples) =>
      (super.noSuchMethod(
          Invocation.method(#assess, [classifier, metricType, samples]),
          returnValue: 0.0) as double);
}

/// A class which mocks [KnnSolver].
///
/// See the documentation for Mockito's code generation for more information.
class MockKnnSolver extends _i1.Mock implements _i18.KnnSolver {
  MockKnnSolver() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get k =>
      (super.noSuchMethod(Invocation.getter(#k), returnValue: 0) as int);
  @override
  _i47.Distance get distanceType =>
      (super.noSuchMethod(Invocation.getter(#distanceType),
          returnValue: _i47.Distance.euclidean) as _i47.Distance);
  @override
  Iterable<Iterable<_i48.Neighbour<_i9.Vector>>> findKNeighbours(
          _i8.Matrix? features) =>
      (super.noSuchMethod(Invocation.method(#findKNeighbours, [features]),
          returnValue: []) as Iterable<Iterable<_i48.Neighbour<_i9.Vector>>>);
}

/// A class which mocks [KnnSolverFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockKnnSolverFactory extends _i1.Mock implements _i49.KnnSolverFactory {
  MockKnnSolverFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i18.KnnSolver create(_i8.Matrix? trainFeatures, _i8.Matrix? trainLabels,
          int? k, _i47.Distance? distanceType, bool? standardize) =>
      (super.noSuchMethod(
          Invocation.method(#create,
              [trainFeatures, trainLabels, k, distanceType, standardize]),
          returnValue: _FakeKnnSolver()) as _i18.KnnSolver);
}

/// A class which mocks [Kernel].
///
/// See the documentation for Mockito's code generation for more information.
class MockKernel extends _i1.Mock implements _i19.Kernel {
  MockKernel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i50.KernelType get type => (super.noSuchMethod(Invocation.getter(#type),
      returnValue: _i50.KernelType.uniform) as _i50.KernelType);
  @override
  num getWeightByDistance(num? distance, [num? bandwidth]) =>
      (super.noSuchMethod(
          Invocation.method(#getWeightByDistance, [distance, bandwidth]),
          returnValue: 0) as num);
  @override
  String toJson() =>
      (super.noSuchMethod(Invocation.method(#toJson, []), returnValue: '')
          as String);
}

/// A class which mocks [KernelFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockKernelFactory extends _i1.Mock implements _i51.KernelFactory {
  MockKernelFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i19.Kernel createByType(_i50.KernelType? type) =>
      (super.noSuchMethod(Invocation.method(#createByType, [type]),
          returnValue: _FakeKernel()) as _i19.Kernel);
}

/// A class which mocks [KnnClassifierFactory].
///
/// See the documentation for Mockito's code generation for more information.
class MockKnnClassifierFactory extends _i1.Mock
    implements _i52.KnnClassifierFactory {
  MockKnnClassifierFactory() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i20.KnnClassifier create(
          _i21.DataFrame? trainData,
          String? targetName,
          int? k,
          _i50.KernelType? kernelType,
          _i47.Distance? distance,
          String? columnPrefix,
          _i36.DType? dtype) =>
      (super.noSuchMethod(
          Invocation.method(#create, [
            trainData,
            targetName,
            k,
            kernelType,
            distance,
            columnPrefix,
            dtype
          ]),
          returnValue: _FakeKnnClassifier()) as _i20.KnnClassifier);
  @override
  _i20.KnnClassifier fromJson(String? json) =>
      (super.noSuchMethod(Invocation.method(#fromJson, [json]),
          returnValue: _FakeKnnClassifier()) as _i20.KnnClassifier);
}

/// A class which mocks [Classifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockClassifier extends _i1.Mock implements _i46.Classifier {
  MockClassifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  num get positiveLabel =>
      (super.noSuchMethod(Invocation.getter(#positiveLabel), returnValue: 0)
          as num);
  @override
  num get negativeLabel =>
      (super.noSuchMethod(Invocation.getter(#negativeLabel), returnValue: 0)
          as num);
  @override
  Iterable<String> get targetNames =>
      (super.noSuchMethod(Invocation.getter(#targetNames), returnValue: [])
          as Iterable<String>);
  @override
  _i36.DType get dtype => (super.noSuchMethod(Invocation.getter(#dtype),
      returnValue: _i36.DType.float32) as _i36.DType);
  @override
  _i21.DataFrame predictProbabilities(_i21.DataFrame? testFeatures) => (super
      .noSuchMethod(Invocation.method(#predictProbabilities, [testFeatures]),
          returnValue: _FakeDataFrame()) as _i21.DataFrame);
  @override
  _i21.DataFrame predict(_i21.DataFrame? testFeatures) =>
      (super.noSuchMethod(Invocation.method(#predict, [testFeatures]),
          returnValue: _FakeDataFrame()) as _i21.DataFrame);
}
