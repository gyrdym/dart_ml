import 'package:ml_algo/src/classifier/decision_tree_classifier/decision_tree_classifier.dart';
import 'package:ml_algo/src/classifier/decision_tree_classifier/decision_tree_serializable_field.dart';
import 'package:ml_algo/src/common/serializable/serializable_mixin.dart';
import 'package:ml_algo/src/common/serializing_rule/dtype_serializing_rule.dart';
import 'package:ml_algo/src/predictor/assessable_predictor_mixin.dart';
import 'package:ml_algo/src/tree_solver/tree_solver.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:ml_linalg/dtype.dart';
import 'package:ml_linalg/matrix.dart';
import 'package:ml_linalg/vector.dart';

class DecisionTreeClassifierImpl
    with
        AssessablePredictorMixin, SerializableMixin
    implements
        DecisionTreeClassifier {

  DecisionTreeClassifierImpl(this._solver, String className, this.dtype)
      : classNames = [className];

  @override
  final DType dtype;

  @override
  final List<String> classNames;

  final TreeSolver _solver;

  @override
  DataFrame predict(DataFrame features) {
    final predictedLabels = features
        .toMatrix(dtype)
        .rows
        .map(_solver.getLabelForSample);

    if (predictedLabels.isEmpty) {
      return DataFrame([<num>[]]);
    }

    final outcomeList = predictedLabels
        .map((label) => label.value)
        .toList(growable: false);
    final outcomeVector = Vector.fromList(outcomeList, dtype: dtype);

    return DataFrame.fromMatrix(
      Matrix.fromColumns([outcomeVector], dtype: dtype),
      header: classNames,
    );
  }

  @override
  DataFrame predictProbabilities(DataFrame features) {
    final probabilities = Matrix.fromColumns([
      Vector.fromList(
        features
            .toMatrix(dtype)
            .rows
            .map(_solver.getLabelForSample)
            .map((label) => label.probability)
            .toList(growable: false),
        dtype: dtype,
      ),
    ], dtype: dtype);

    return DataFrame.fromMatrix(
      probabilities,
      header: classNames,
    );
  }

  @override
  Map<String, dynamic> serialize() => <String, dynamic>{
    dtypeField: dtypeSerializingRule[dtype],
    classNamesField: classNames,
    solverField: _solver.serialize(),
  };
}
