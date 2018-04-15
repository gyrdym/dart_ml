import 'package:dart_ml/src/core/metric/regression/type.dart';
import 'package:dart_ml/src/core/optimizer/regularization.dart';
import 'package:dart_ml/src/core/regressor/regressor_impl.dart';
import 'package:dart_ml/src/di/factory.dart';

class MBGDRegressor extends RegressorImpl {
  MBGDRegressor({
    int iterationLimit,
    double learningRate,
    double minWeightsDistance,
    double alpha,
    double argumentIncrement,
    RegressionMetricType metric,
    Regularization regularization
  }) : super(
    ModuleFactory.MBGDRegressionModule(
      learningRate: learningRate,
      minWeightsDistance: minWeightsDistance,
      iterationLimit: iterationLimit,
      metric: metric,
      regularization: regularization,
      lambda: alpha,
      argumentIncrement: argumentIncrement
    )
  );
}
