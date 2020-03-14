import 'package:ml_algo/src/common/serializable/serializable.dart';
import 'package:ml_algo/src/tree_solver/leaf_label/leaf_label.dart';
import 'package:ml_algo/src/tree_solver/tree_node.dart';
import 'package:ml_linalg/vector.dart';

abstract class TreeSolver extends Serializable {
  TreeNode get root;
  TreeLeafLabel getLabelForSample(Vector sample);
}
