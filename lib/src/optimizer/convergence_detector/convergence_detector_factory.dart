import 'package:ml_algo/src/optimizer/convergence_detector/convergence_detector.dart';

abstract class ConvergenceDetectorFactory {
  ConvergenceDetector create(double minUpdate, int iterationsLimit);
}
