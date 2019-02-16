import 'package:ml_algo/src/classifier/classifier.dart';
import 'package:ml_algo/src/classifier/logistic_regressor.dart';
import 'package:ml_algo/src/optimizer/gradient/learning_rate_generator/learning_rate_type.dart';
import 'package:ml_algo/src/optimizer/optimizer_type.dart';
import 'package:ml_algo/src/regressor/gradient_type.dart';

/// A factory for all the linear classifiers
abstract class LinearClassifier implements Classifier {
  /**
   * Creates a logistic regressor classifier.
   *
   * Logistic regression is an algorithm that solves a binary classification
   * problem. The algorithm can be used also for multiclass classification - in
   * this case multiclass labels encoded as one-vs-all, and per each label one
   * classifier is fitted. This approach is also called "ovr" (one versus rest)
   * multiclass classification. The algorithm uses maximization of the passed
   * data likelihood. In other words, the regressor iteratively tries to select
   * coefficients, that makes combination of passed features and these
   * coefficients most likely.
   *
   * Parameters:
   *
   * [iterationsLimit] A number of fitting iterations. Uses as a condition of
   * convergence in the [optimizer]. Default value is 100
   *
   * [initialLearningRate] A value, defining velocity of the convergence of the
   * gradient descent optimizer. Will be ignored, if passed [optimizer] is not
   * a gradient optimizer. Default value is 1e-3
   *
   * [minWeightsUpdate] A minimum distance between weights vectors in two
   * subsequent iterations. Uses as a condition of convergence in the
   * [optimizer]. In other words, if difference is small, there is no reason to
   * continue fitting. Default value is 1e-12
   *
   * [lambda] A coefficient for regularization. Type of regularization depends
   * on the [optimizer]. If the [optimizer] is a gradient optimizer, L1
   * regularization is not applicable, but if the [optimizer] is a coordinate
   * optimizer, one can use L1 method.
   *
   * [randomSeed] A seed, that will be passed to a random value generator,
   * used by stochastic optimizers. Will be ignored, if the [optimizer] is not
   * a stochastic. Remember, each time you run the regressor based on, for
   * instance, stochastic gradient descent, with the same parameters, you will
   * receive a different result. To avoid it, define [randomSeed]
   *
   * [batchSize] A size of data (in rows), that will be used for fitting per
   * one iteration. Will be ignored, if passed [optimizer] is not a gradient
   * optimizer
   *
   * [fitIntercept] Whether or not to fit intercept term. Default value is
   * `false`.
   *
   * [interceptScale] A value, defining a size of the intercept term
   *
   * [learningRateType] A value, defining a strategy for the learning rate
   * behaviour throughout the whole fitting process. Will be ignored if the
   * [optimizer] is not a gradient optimizer
   *
   * [optimizer] A type of optimizer (gradient descent, coordinate descent and
   * so on)
   *
   * [gradientType] A type of gradient descent optimizer (stochastic, mini
   * batch, batch). Will be ignored for all non-gradient optimizers
   *
   * [dtype] A data type for all the numeric values, used by the algorithm. Can
   * affect performance or accuracy of the computations. Default value is
   * [Float32x4]
   */
  factory LinearClassifier.logisticRegressor({
    int iterationsLimit,
    double initialLearningRate,
    double minWeightsUpdate,
    double lambda,
    int randomSeed,
    int batchSize,
    bool fitIntercept,
    double interceptScale,
    LearningRateType learningRateType,
    OptimizerType optimizer,
    GradientType gradientType,
    Type dtype,
  }) = LogisticRegressor;

  factory LinearClassifier.softMaxRegressor() => throw UnimplementedError();
  factory LinearClassifier.SVM() => throw UnimplementedError();
  factory LinearClassifier.naiveBayes() => throw UnimplementedError();
}