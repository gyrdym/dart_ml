import 'package:ml_algo/src/helpers/add_intercept_if.dart';
import 'package:ml_algo/src/predictor/assessable_predictor_mixin.dart';
import 'package:ml_algo/src/regressor/linear_regressor/linear_regressor.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:ml_linalg/dtype.dart';
import 'package:ml_linalg/matrix.dart';
import 'package:ml_linalg/vector.dart';

class LinearRegressorImpl with AssessablePredictorMixin
    implements LinearRegressor {

  LinearRegressorImpl(this.coefficients, this._targetName, {
    bool fitIntercept = false,
    double interceptScale = 1.0,
    Matrix initialCoefficients,
    this.dtype = DType.float32,
  }) :
    fitIntercept = fitIntercept,
    interceptScale = interceptScale;

  final String _targetName;

  @override
  final bool fitIntercept;

  @override
  final double interceptScale;

  @override
  final Vector coefficients;

  @override
  final DType dtype;

  @override
  DataFrame predict(DataFrame features) {
    final prediction = addInterceptIf(
      fitIntercept,
      features.toMatrix(),
      interceptScale,
    ) * coefficients;

    return DataFrame.fromMatrix(
        prediction,
        header: [_targetName],
    );
  }
}
