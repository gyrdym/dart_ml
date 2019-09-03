import 'package:ml_algo/src/solver/non_linear/decision_tree/decision_tree_node.dart';
import 'package:ml_algo/src/solver/non_linear/decision_tree/splitter/numerical_splitter/numerical_splitter.dart';
import 'package:ml_linalg/matrix.dart';
import 'package:ml_linalg/vector.dart';
import 'package:xrange/zrange.dart';

class NumericalSplitterImpl implements NumericalSplitter {
  const NumericalSplitterImpl();

  @override
  Map<DecisionTreeNode, Matrix> split(Matrix samples, int splittingIdx,
      double splittingValue) {
    final left = <Vector>[];
    final right = <Vector>[];
    final splittingClause =
        (Vector sample) => sample[splittingIdx] < splittingValue;
    final oppositeClause = (Vector sample) => !splittingClause(sample);

    samples.rows.forEach((row) => splittingClause(row)
        ? left.add(row)
        : right.add(row));

    final createNode = (TestSamplePredicate splittingClause) =>
        DecisionTreeNode(splittingClause, splittingValue, null, splittingIdx,
            null, null);

    final leftNode = createNode(splittingClause);
    final rightNode = createNode(oppositeClause);

    return {
      leftNode: Matrix.fromRows(left),
      rightNode: Matrix.fromRows(right),
    };
  }
}
