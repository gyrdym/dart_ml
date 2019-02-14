import 'package:ml_linalg/matrix.dart';
import 'package:ml_linalg/vector.dart';

abstract class Optimizer {
  /// Accepts points (a matrix of all the X-coordinates values), a vector of y-labels and returns a matrix
  /// of corresponding coefficients (weights).
  ///
  /// [points] input X coordinates values
  /// [labels] input y coordinate values
  /// [numOfCoefficientVectors] optional parameter
  /// [initialWeights] initial weights (coefficients) to start optimization (e.g. random values)
  /// [isMinimizingObjective] should the optimizer find a maxima or minima
  /// [arePointsNormalized] `true` means that all the [points] columns are normalized (whether the sum of each column
  /// values gives 1.0 or not)
  MLMatrix findExtrema(MLMatrix points, MLVector labels,
      {
        int numOfCoefficientVectors,
        MLMatrix initialWeights,
        bool isMinimizingObjective,
        bool arePointsNormalized
      });
}
