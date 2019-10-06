import 'package:ml_algo/src/common/serializable/serializable_mixin.dart';
import 'package:ml_algo/src/decision_tree_solver/decision_tree_leaf_label.dart';
import 'package:ml_linalg/vector.dart';

typedef TestSamplePredicate = bool Function(Vector sample);

class DecisionTreeNode with SerializableMixin {
  DecisionTreeNode(
      this.testSample,
      this.splittingValue,
      this.splittingIdx,
      this.children,
      this.label,
      [
        this.level = 0,
      ]
  );

  final List<DecisionTreeNode> children;
  final DecisionTreeLeafLabel label;
  final TestSamplePredicate testSample;
  final num splittingValue;
  final int splittingIdx;
  final int level;

  bool get isLeaf => children == null || children.isEmpty;

  @override
  Map<String, dynamic> serialize() => <String, dynamic>{
    'splittingValue': splittingValue,
    'splittingIdx': splittingIdx,
    'level': level,
    'label': label?.serialize(),
    'children': children?.map((node) => node.serialize())?.toList(),
  };
}