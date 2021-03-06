import 'package:ml_algo/ml_algo.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:ml_linalg/dtype.dart';

abstract class DecisionTreeClassifierFactory {
  DecisionTreeClassifier create(
    DataFrame trainData,
    String targetName,
    DType dtype,
    num minError,
    int minSamplesCount,
    int maxDepth,
  );

  DecisionTreeClassifier fromJson(String json);
}
