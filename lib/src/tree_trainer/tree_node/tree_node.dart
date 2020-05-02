import 'package:json_annotation/json_annotation.dart';
import 'package:ml_algo/src/tree_trainer/leaf_label/_helper/from_leaf_label_json.dart';
import 'package:ml_algo/src/tree_trainer/leaf_label/_helper/leaf_label_to_json.dart';
import 'package:ml_algo/src/tree_trainer/leaf_label/leaf_label.dart';
import 'package:ml_algo/src/tree_trainer/tree_node/_helper/from_tree_nodes_json.dart';
import 'package:ml_algo/src/tree_trainer/tree_node/_helper/tree_nodes_to_json.dart';
import 'package:ml_algo/src/tree_trainer/tree_node/splitting_predicate/tree_node_splitting_predicate.dart';
import 'package:ml_algo/src/tree_trainer/tree_node/splitting_predicate/tree_node_splitting_predicate_type.dart';
import 'package:ml_linalg/vector.dart';

part 'tree_node.g.dart';

@JsonSerializable()
class TreeNode {
  TreeNode(
      this.predicateType,
      this.splittingValue,
      this.splittingIndex,
      this.children,
      this.label,
      [
        this.level = 0,
      ]
  );

  factory TreeNode.fromJson(Map<String, dynamic> json) =>
      _$TreeNodeFromJson(json);

  Map<String, dynamic> toJson() => _$TreeNodeToJson(this);

  @JsonKey(
    name: 'CN',
    toJson: treeNodesToJson,
    fromJson: fromTreeNodesJson,
  )
  final List<TreeNode> children;

  @JsonKey(
    name: 'LB',
    toJson: leafLabelToJson,
    fromJson: fromLeafLabelJson,
  )
  final TreeLeafLabel label;

  @JsonKey(name: 'PT')
  final TreeNodeSplittingPredicateType predicateType;

  @JsonKey(name: 'SV')
  final num splittingValue;

  @JsonKey(name: 'SI')
  final int splittingIndex;

  @JsonKey(name: 'LV')
  final int level;

  bool get isLeaf => children == null || children.isEmpty;

  bool isSamplePassed(Vector sample) =>
      getSplittingPredicateByType(predicateType)(
        sample,
        splittingIndex,
        splittingValue,
      );
}