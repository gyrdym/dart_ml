import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:ml_linalg/dtype.dart';
import 'package:ml_linalg/vector.dart';
import 'package:test/test.dart';

Future<Vector> evaluateLogisticRegressor(MetricType metric, DType dtype) async {
  final samples = (await fromCsv('e2e/_datasets/pima_indians_diabetes_database.csv'))
      .shuffle();
  final numberOfFolds = 5;
  final targetNames = ['class variable (0 or 1)'];
  final validator = CrossValidator.kFold(
    samples,
    numberOfFolds: numberOfFolds,
  );
  final createClassifier = (DataFrame trainSamples) =>
      LogisticRegressor(
        trainSamples,
        targetNames.first,
        optimizerType: LinearOptimizerType.gradient,
        iterationsLimit: 200,
        initialLearningRate: 1e-5,
        learningRateType: LearningRateType.decreasingAdaptive,
        batchSize: trainSamples.rows.length,
        probabilityThreshold: 0.5,
        dtype: dtype,
      );

  return validator.evaluate(
    createClassifier,
    metric,
  );
}

Future main() async {
  group('LogisticRegressor', () {
    test('should return adequate score on pima indians diabetes dataset using '
        'accuracy metric, dtype=DType.float32', () async {
      final scores = await evaluateLogisticRegressor(MetricType.accuracy,
          DType.float32);

      expect(scores.mean(), greaterThan(0.5));
    });

    test('should return adequate score on pima indians diabetes dataset using '
        'accuracy metric, dtype=DType.float64', () async {
      final scores = await evaluateLogisticRegressor(MetricType.accuracy,
          DType.float32);

      expect(scores.mean(), greaterThan(0.5));
    });

    test('should return adequate score on pima indians diabetes dataset using '
        'precision metric, dtype=DType.float32', () async {
      final scores = await evaluateLogisticRegressor(MetricType.precision,
          DType.float32);

      expect(scores.mean(), greaterThan(0.5));
    });

    test('should return adequate score on pima indians diabetes dataset using '
        'precision metric, dtype=DType.float64', () async {
      final scores = await evaluateLogisticRegressor(MetricType.precision,
          DType.float32);

      expect(scores.mean(), greaterThan(0.5));
    });

    test('should return adequate score on pima indians diabetes dataset using '
        'recall metric, dtype=DType.float32', () async {
      final scores = await evaluateLogisticRegressor(MetricType.recall,
          DType.float32);

      expect(scores.mean(), greaterThan(0.5));
    });

    test('should return adequate score on pima indians diabetes dataset using '
        'recall metric, dtype=DType.float64', () async {
      final scores = await evaluateLogisticRegressor(MetricType.recall,
          DType.float32);

      expect(scores.mean(), greaterThan(0.5));
    });
  });
}
