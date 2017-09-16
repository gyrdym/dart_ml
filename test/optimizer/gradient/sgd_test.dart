import 'dart:typed_data';
import 'package:di/di.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:simd_vector/vector.dart';
import 'package:dart_ml/src/di/injector.dart';
import 'package:dart_ml/src/interface.dart';
import 'package:dart_ml/src/implementation.dart';
import 'package:dart_ml/src/loss_function/loss_function.dart';
import 'package:dart_ml/src/score_function/score_function.dart';

class RandomizerMock extends Mock implements Randomizer {
  int _iterationCounter = 0;

  int getIntegerFromInterval(int start, int end) {
    int randomInt;

    if (_iterationCounter % 2 == 0) {
      randomInt = 1;
    } else {
      randomInt = 0;
    }

    _iterationCounter++;

    return randomInt;
  }
}

void main() {
  List<Float32x4Vector> data;
  Float32List target;

  setUp(() {
    data = [
      new Float32x4Vector.from([230.1, 37.8, 69.2]),
      new Float32x4Vector.from([44.5, 39.3, 45.1])
    ];

    target = new Float32List.fromList([22.1, 10.4, 9.3]);
  });

  group('Stochastic gradient descent optimizer', () {
    SGDOptimizer optimizer;

    setUp(() {
      injector = new ModuleInjector([
        new Module()
          ..bind(Randomizer, toFactory: () => new RandomizerMock())
      ]);

      optimizer = GradientOptimizerFactory.createStochasticOptimizer();
      optimizer.configure(
          learningRate: 1e-5,
          minWeightsDistance: null,
          iterationLimit:  10,
          regularization: Regularization.L2,
          alpha: .00001,
          lossFunction: new LossFunction.Squared(),
          scoreFunction: new ScoreFunction.Linear()
      );
    });

    test('should find optimal weights for the given data', () {
      Float32x4Vector weights = optimizer.findMinima(data, target);
      expect(weights.asList(), equals([]));
    });
  });
}