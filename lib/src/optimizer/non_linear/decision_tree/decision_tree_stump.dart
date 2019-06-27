import 'package:ml_algo/src/optimizer/non_linear/decision_tree/decisition_tree_base_node.dart';
import 'package:ml_linalg/matrix.dart';
import 'package:ml_linalg/vector.dart';
import 'package:xrange/zrange.dart';

class DecisionTreeStump extends DecisionTreeBaseNode {
  DecisionTreeStump(double splittingValue, List<Vector> categoricalValues,
      ZRange splittingColumnRange, this.outputObservations) :
        super(splittingValue, categoricalValues, splittingColumnRange);

  final Iterable<Matrix> outputObservations;
}
