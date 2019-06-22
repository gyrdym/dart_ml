import 'package:ml_algo/src/classifier/classifier.dart';
import 'package:ml_algo/src/classifier/softmax_regressor/gradient_softmax_regressor.dart';
import 'package:ml_algo/src/model_selection/assessable.dart';
import 'package:ml_algo/src/optimizer/linear/gradient/learning_rate_generator/learning_rate_type.dart';
import 'package:ml_linalg/dtype.dart';
import 'package:ml_linalg/matrix.dart';

/// A factory that creates different presets of softmax regressors
///
/// Softmax regression is an algorithm that solves a multiclass classification
/// problem. The algorithm uses maximization of the passed
/// data likelihood (as well as
/// [Logistic regression](https://en.wikipedia.org/wiki/Logistic_regression).
/// In other words, the regressor iteratively tries to select coefficients,
/// that makes combination of passed features and these coefficients most
/// likely. But, instead of [Logit link function](https://en.wikipedia.org/wiki/Logit)
/// it uses [Softmax link function](https://en.wikipedia.org/wiki/Softmax_function),
/// that's why the algorithm has such a name.
///
/// Also, it is worth to mention, that the algorithm is a generalization of
/// [Logistic regression](https://en.wikipedia.org/wiki/Logistic_regression))
abstract class SoftmaxRegressor implements Classifier, Assessable {
  /// Creates a gradient descent based softmax regressor classifier.
  ///
  /// Parameters:
  ///
  /// [trainingFeatures] A matrix with observations, that will be used by the
  /// classifier to learn coefficients of the hyperplane, which divides the
  /// features space, forming classes of the features
  ///
  /// [trainingOutcomes] A matrix with outcomes (class labels, or dependant
  /// variables) for each observation from [trainingFeatures]
  ///
  /// [iterationsLimit] A number of fitting iterations. Uses as a condition of
  /// convergence in the [optimizer]. Default value is 100
  ///
  /// [initialLearningRate] A value, defining velocity of the convergence of the
  /// gradient descent optimizer. Default value is 1e-3
  ///
  /// [minWeightsUpdate] A minimum distance between weights vectors in two
  /// subsequent iterations. Uses as a condition of convergence in the
  /// [optimizer]. In other words, if difference is small, there is no reason to
  /// continue fitting. Default value is 1e-12
  ///
  /// [lambda] A coefficient of regularization. In gradient version of softmax
  /// regression L2 regularisation is used.
  ///
  /// [randomSeed] A seed, that will be passed to a random value generator,
  /// used by stochastic optimizers. Will be ignored, if the [optimizer] is not
  /// a stochastic. Remember, each time you run the regressor based on, for
  /// instance, stochastic gradient descent, with the same parameters, you will
  /// receive a different result. To avoid it, define [randomSeed]
  ///
  /// [batchSize] A size of data (in rows), that will be used for fitting per
  /// one iteration. If [batchSize] == `1` when stochastic gradient descent is
  /// used; if `1` < [batchSize] < `total number of rows`, when mini-batch
  /// gradient descent is used; if [batchSize] == `total number of rows`,
  /// when full-batch gradient descent is used
  ///
  /// [fitIntercept] Whether or not to fit intercept term. Default value is
  /// `false`.
  ///
  /// [interceptScale] A value, defining a size of the intercept term
  ///
  /// [learningRateType] A value, defining a strategy for the learning rate
  /// behaviour throughout the whole fitting process.
  ///
  /// [dtype] A data type for all the numeric values, used by the algorithm. Can
  /// affect performance or accuracy of the computations. Default value is
  /// [DType.float32]
  factory SoftmaxRegressor.gradient(
      Matrix trainingFeatures,
      Matrix trainingOutcomes, {
        int iterationsLimit,
        double initialLearningRate,
        double minWeightsUpdate,
        double lambda,
        int randomSeed,
        int batchSize,
        bool fitIntercept,
        double interceptScale,
        LearningRateType learningRateType,
        Matrix initialWeights,
        DType dtype,
      }) = GradientSoftmaxRegressor;
}