import 'package:ml_algo/src/classifier/logistic_regressor/logistic_regressor.dart';
import 'package:ml_algo/src/linear_optimizer/gradient_optimizer/learning_rate_generator/learning_rate_type.dart';
import 'package:ml_algo/src/linear_optimizer/initial_coefficients_generator/initial_coefficients_type.dart';
import 'package:ml_algo/src/linear_optimizer/linear_optimizer_type.dart';
import 'package:ml_algo/src/linear_optimizer/regularization_type.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:ml_linalg/dtype.dart';
import 'package:ml_linalg/vector.dart';

abstract class LogisticRegressorFactory {
  LogisticRegressor create({
    required DataFrame trainData,
    required String targetName,
    LinearOptimizerType optimizerType,
    int iterationsLimit,
    double initialLearningRate,
    double minCoefficientsUpdate,
    double probabilityThreshold,
    double lambda,
    RegularizationType? regularizationType,
    int? randomSeed,
    int batchSize,
    bool fitIntercept,
    double interceptScale,
    bool isFittingDataNormalized,
    LearningRateType learningRateType,
    InitialCoefficientsType initialCoefficientsType,
    Vector? initialCoefficients,
    required num positiveLabel,
    required num negativeLabel,
    bool collectLearningData,
    DType dtype,
  });

  LogisticRegressor fromJson(String json);
}
