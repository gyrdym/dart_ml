import 'package:ml_algo/src/classifier/decision_tree_classifier/decision_tree_classifier_impl.dart';
import 'package:ml_algo/src/classifier/decision_tree_classifier/decision_tree_serializable_field.dart';
import 'package:ml_algo/src/common/serializable/serializer.dart';
import 'package:ml_algo/src/tree_trainer/leaf_label/leaf_label.dart';
import 'package:ml_algo/src/tree_trainer/tree_node/tree_node.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:ml_linalg/dtype.dart';
import 'package:ml_linalg/matrix.dart';
import 'package:ml_linalg/vector.dart';
import 'package:ml_tech/unit_testing/matchers/iterable_2d_almost_equal_to.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks.dart';

void main() {
  group('DecisionTreeClassifierImpl', () {
    test('should call appropriate method from `solver` when making '
        'classes prediction for nominal class labels', () {
      final treeNodeSerializer = createTreeNodeSerializer();

      final sample1 = Vector.fromList([1, 2, 3]);
      final sample2 = Vector.fromList([10, 20, 30]);
      final sample3 = Vector.fromList([100, 200, 300]);

      final features = Matrix.fromRows([
        sample1,
        sample2,
        sample3,
      ]);

      final label1 = 0.0;
      final label2 = 1.0;
      final label3 = 2.0;

      final rootMock = createRootNodeMock({
        sample1: TreeLeafLabel(label1),
        sample2: TreeLeafLabel(label2),
        sample3: TreeLeafLabel(label3),
      });

      final classifier = DecisionTreeClassifierImpl(
          rootMock,
          'class_name',
          DType.float32,
          treeNodeSerializer,
      );

      final predictedClasses = classifier.predict(
        DataFrame.fromMatrix(features),
      );

      expect(predictedClasses.header, equals(['class_name']));

      expect(predictedClasses.toMatrix(), equals([
        [label1],
        [label2],
        [label3],
      ]));
    });

    test('should return an empty matrix if input feature matrix is '
        'empty', () {
      final treeNodeSerializer = createTreeNodeSerializer();
      final rootNode = TreeNodeMock();
      final classifier = DecisionTreeClassifierImpl(
        rootNode,
        'class_name',
        DType.float32,
        treeNodeSerializer,
      );
      final predictedClasses = classifier.predict(DataFrame([<num>[]]));

      expect(predictedClasses.header, isEmpty);
      expect(predictedClasses.toMatrix(), isEmpty);
    });

    test('should call an appropriate method from `solver` while predicting '
        'class labels for nominal class label type', () {
      final treeNodeSerializer = createTreeNodeSerializer();

      final sample1 = Vector.fromList([1, 2, 3]);
      final sample2 = Vector.fromList([10, 20, 30]);
      final sample3 = Vector.fromList([100, 200, 300]);

      final features = Matrix.fromRows([
        sample1,
        sample2,
        sample3,
      ]);

      final label1 = TreeLeafLabel(0, probability: 0.7);
      final label2 = TreeLeafLabel(1, probability: 0.55);
      final label3 = TreeLeafLabel(2, probability: 0.5);

      final solverMock = createRootNodeMock({
        sample1: label1,
        sample2: label2,
        sample3: label3,
      });

      final classifier = DecisionTreeClassifierImpl(
        solverMock,
        'class_name',
        DType.float32,
        treeNodeSerializer,
      );

      final predictedLabels = classifier.predictProbabilities(
        DataFrame.fromMatrix(features),
      );

      expect(predictedLabels.header, equals(['class_name']));
      expect(
          predictedLabels.toMatrix(),
          iterable2dAlmostEqualTo([
            [label1.probability.toDouble()],
            [label2.probability.toDouble()],
            [label3.probability.toDouble()],
          ]),
      );
    });

    test('should serialize itself', () {
      final treeNodeSerializer = createTreeNodeSerializer();

      final sample1 = Vector.fromList([1, 2, 3]);
      final sample2 = Vector.fromList([10, 20, 30]);
      final sample3 = Vector.fromList([100, 200, 300]);

      final label1 = TreeLeafLabel(0, probability: 0.7);
      final label2 = TreeLeafLabel(1, probability: 0.55);
      final label3 = TreeLeafLabel(2, probability: 0.5);

      final solverMock = createRootNodeMock({
        sample1: label1,
        sample2: label2,
        sample3: label3,
      });

      final classifier = DecisionTreeClassifierImpl(
        solverMock,
        'class_name',
        DType.float32,
        treeNodeSerializer,
      );

      final data = classifier.serialize();

      expect(data, equals({
        dtypeField: 'float32',
        classNamesField: ['class_name'],
        rootNodeField: null,
      }));
    });
  });
}

TreeNode createRootNodeMock(Map<Vector, TreeLeafLabel> samples) {
  final rootMock = TreeNodeMock();
  final children = <TreeNode>[];

  when(rootMock.isLeaf).thenReturn(false);

  samples.forEach((sample, leafLabel) {
    final node = TreeNodeMock();

    when(node.label).thenReturn(leafLabel);
    when(node.isLeaf).thenReturn(true);

    samples.forEach((otherSample, _) {
      when(node.isSamplePassed(otherSample)).thenReturn(sample == otherSample);
    });

    children.add(node);
  });
  
  when(rootMock.children).thenReturn(children);

  return rootMock;
}

Serializer<TreeNode> createTreeNodeSerializer() {
  final serializer = TreeNodeSerializerMock();
  when(serializer.serialize(any)).thenReturn(null);
  return serializer;
}
