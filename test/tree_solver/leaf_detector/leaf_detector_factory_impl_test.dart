import 'package:ml_algo/src/tree_trainer/leaf_detector/leaf_detector_factory_impl.dart';
import 'package:ml_algo/src/tree_trainer/leaf_detector/leaf_detector_impl.dart';
import 'package:ml_algo/src/tree_trainer/split_assessor/split_assessor_type.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks.dart';

void main() {
  group('TreeLeafDetectorFactoryImpl', () {
    final splitAssessorMock = TreeSplitAssessorMock();
    final splitAssessorFactoryMock = createTreeSplitAssessorFactoryMock(
        splitAssessorMock);
    final factory = TreeLeafDetectorFactoryImpl(splitAssessorFactoryMock);

    setUp(() {
      reset(splitAssessorMock);
      reset(splitAssessorFactoryMock);
    });

    final assessorType = TreeSplitAssessorType.majority;
    final minErrorOnNode = 0.7;
    final minSamplesCount = 3;
    final maxDepth = 4;

    test('should create a TreeLeafDetectorImpl instance', () {
      final detector = factory.create(
        assessorType,
        minErrorOnNode,
        minSamplesCount,
        maxDepth,
      );

      expect(detector, isA<TreeLeafDetectorImpl>());
    });

    test('should call split assessor factory while creating the instance', () {
      factory.create(
        assessorType,
        minErrorOnNode,
        minSamplesCount,
        maxDepth,
      );

      verify(splitAssessorFactoryMock.createByType(assessorType)).called(1);
    });
  });
}
