import 'package:ml_algo/src/classifier/classifier.dart';
import 'package:ml_algo/src/helpers/add_intercept_if.dart';
import 'package:ml_algo/src/helpers/get_probabilities.dart';
import 'package:ml_algo/src/link_function/link_function.dart';
import 'package:ml_algo/src/metric/factory.dart';
import 'package:ml_algo/src/metric/metric_type.dart';
import 'package:ml_algo/src/model_selection/assessable.dart';
import 'package:ml_linalg/matrix.dart';

mixin LinearClassifierMixin implements Classifier, Assessable {
  LinkFunction get linkFunction;
  bool get fitIntercept;
  double get interceptScale;

  @override
  double assess(Matrix features, Matrix origLabels, MetricType metricType) {
    final metric = MetricFactory.createByType(metricType);
    return metric.getScore(predictClasses(features), origLabels);
  }

  @override
  Matrix predictProbabilities(Matrix features) {
    final processedFeatures = addInterceptIf(fitIntercept, features,
        interceptScale);
    return getProbabilities(processedFeatures,
        coefficientsByClasses, linkFunction);
  }
}
