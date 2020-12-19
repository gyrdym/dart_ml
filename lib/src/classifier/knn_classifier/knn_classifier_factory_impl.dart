import 'package:ml_algo/src/classifier/knn_classifier/knn_classifier.dart';
import 'package:ml_algo/src/classifier/knn_classifier/knn_classifier_factory.dart';
import 'package:ml_algo/src/classifier/knn_classifier/knn_classifier_impl.dart';
import 'package:ml_algo/src/knn_kernel/kernel.dart';
import 'package:ml_algo/src/knn_solver/knn_solver.dart';
import 'package:ml_linalg/dtype.dart';

class KnnClassifierFactoryImpl implements KnnClassifierFactory {
  const KnnClassifierFactoryImpl();

  @override
  KnnClassifier create(
      String targetName,
      List<num> classLabels,
      Kernel kernel,
      KnnSolver solver,
      String columnPrefix,
      DType dtype,
  ) => KnnClassifierImpl(
    targetName,
    classLabels,
    kernel,
    solver,
    columnPrefix,
    dtype,
  );
}
