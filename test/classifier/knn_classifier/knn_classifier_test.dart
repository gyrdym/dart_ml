import 'package:ml_algo/ml_algo.dart';
import 'package:ml_algo/src/classifier/knn_classifier/_injector.dart';
import 'package:ml_algo/src/classifier/knn_classifier/knn_classifier.dart';
import 'package:ml_algo/src/classifier/knn_classifier/knn_classifier_factory.dart';
import 'package:ml_algo/src/di/injector.dart';
import 'package:ml_algo/src/knn_kernel/kernel_type.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:ml_linalg/distance.dart';
import 'package:ml_linalg/dtype.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../mocks.dart';

void main() {
  group('KnnClassifier', () {
    final classLabelPrefix = 'class label';
    final data = DataFrame.fromSeries(
        [
          Series('first' , <num>[1, 1, 1, 1]),
          Series('second', <num>[2, 2, 2, 2]),
          Series('third' , <num>[2, 2, 2, 2]),
          Series('fourth', <num>[4, 4, 4, 4]),
          Series('fifth' , <num>[1, 3, 2, 1], isDiscrete: true),
        ],
    );

    final targetName = 'fifth';

    KnnClassifier knnClassifierMock;
    KnnClassifierFactory knnClassifierFactoryMock;

    setUp(() async {
      knnClassifierMock = KnnClassifierMock();
      knnClassifierFactoryMock = createKnnClassifierFactoryMock(
          knnClassifierMock);

      await knnClassifierModule.reset();

      knnClassifierModule
          .registerSingleton<KnnClassifierFactory>(knnClassifierFactoryMock);
    });

    tearDown(() async {
      reset(knnClassifierMock);
      reset(knnClassifierFactoryMock);

      await module.reset();
      await knnClassifierModule.reset();
    });

    test('should call KnnClassifierFactory in order to create a classifier', () {
      final classifier = KnnClassifier(
        data,
        targetName,
        2,
        kernel: KernelType.uniform,
        distance: Distance.cosine,
        classLabelPrefix: classLabelPrefix,
        dtype: DType.float32,
      );

      verify(knnClassifierFactoryMock.create(
        data,
        targetName,
        2,
        KernelType.uniform,
        Distance.cosine,
        classLabelPrefix,
        DType.float32,
      )).called(1);

      expect(classifier, same(knnClassifierMock));
    });
  });
}
