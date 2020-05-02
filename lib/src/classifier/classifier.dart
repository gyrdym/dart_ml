import 'package:ml_algo/src/predictor/predictor.dart';
import 'package:ml_dataframe/ml_dataframe.dart';

/// An interface for any classifier (linear, non-linear, parametric,
/// non-parametric, etc.)
abstract class Classifier extends Predictor {
  /// Returns predicted distribution of probabilities for each observation in
  /// the passed [testFeatures]
  DataFrame predictProbabilities(DataFrame testFeatures);
}
