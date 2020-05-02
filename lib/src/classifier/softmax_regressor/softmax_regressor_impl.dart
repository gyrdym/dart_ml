import 'package:ml_algo/src/classifier/_mixins/linear_classifier_mixin.dart';
import 'package:ml_algo/src/classifier/softmax_regressor/softmax_regressor.dart';
import 'package:ml_algo/src/helpers/validate_coefficients_matrix.dart';
import 'package:ml_algo/src/link_function/link_function.dart';
import 'package:ml_algo/src/predictor/assessable_predictor_mixin.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:ml_linalg/dtype.dart';
import 'package:ml_linalg/linalg.dart';
import 'package:ml_linalg/matrix.dart';

class SoftmaxRegressorImpl with LinearClassifierMixin,
    AssessablePredictorMixin implements SoftmaxRegressor {

  SoftmaxRegressorImpl(
      this.coefficientsByClasses,
      this.classNames,
      this.linkFunction,
      this.fitIntercept,
      this.interceptScale,
      this._positiveLabel,
      this._negativeLabel,
      this.dtype,
  ) {
    validateCoefficientsMatrix(coefficientsByClasses);

    // Softmax regression specific check, it cannot be placed in
    // `validateCoefficientsMatrix`
    if (coefficientsByClasses.columnsNum < 2) {
      throw Exception('Expected coefficients at least for two classes. '
          'Please, check your linear optimizer implementation or the way your '
          'data was encoded');
    }
  }

  @override
  final Iterable<String> classNames;

  @override
  final bool fitIntercept;

  @override
  final num interceptScale;

  @override
  final Matrix coefficientsByClasses;

  @override
  final DType dtype;

  @override
  final LinkFunction linkFunction;

  final num _positiveLabel;

  final num _negativeLabel;

  @override
  DataFrame predict(DataFrame testFeatures) {
    final allProbabilities = getProbabilitiesMatrix(testFeatures);

    final classes = allProbabilities.mapRows((probabilities) {
      final positiveLabelIdx = probabilities
          .toList()
          .indexOf(probabilities.max());

      final predictedRow = List.filled(
        coefficientsByClasses.columnsNum,
        _negativeLabel,
      );

      predictedRow[positiveLabelIdx] = _positiveLabel;

      return Vector.fromList(predictedRow, dtype: dtype);
    });

    return DataFrame.fromMatrix(
      classes,
      header: classNames,
    );
  }
}
