import 'package:ml_algo/src/algorithms/knn.dart';
import 'package:ml_linalg/matrix.dart';
import 'package:test_api/test_api.dart';

void main() {
  group('findKNeighbours', () {
    test('should find k neighbours for each of N passed observations, '
        '0 < k < N', () {

      final k = 3;

      final y1 = [100.0];
      final y2 = [200.0];
      final y3 = [300.0];
      final y4 = [400.0];
      final y5 = [500.0];
      final y6 = [600.0];
      final y7 = [700.0];
      final y8 = [800.0];

      final observations = Matrix.from([
        [10, 10, 10, 10, 10],
        [3, 3, 3, 3, 3],
      ]);

      final trainObservations = Matrix.from([
        [15, 15, 15, 15, 15],
        [14, 14, 14, 14, 14],
        [16, 16, 16, 16, 16],
        [18, 18, 18, 18, 18],
        [17, 17, 17, 17, 17],
        [13, 13, 13, 13, 13],
        [12, 12, 12, 12, 12],
        [5, 5, 5, 5, 5],
      ]);

      final trainOutcomes = Matrix.from([y1, y2, y3, y4, y5, y6, y7, y8]);

      final actual = findKNeighbours(k, trainObservations, trainOutcomes,
          observations).toList();

      expect([
        actual[0].map((pair) => pair.item2),
        actual[1].map((pair) => pair.item2),
      ],
      equals([
        [y7, y6, y2],
        [y8, y7, y6],
      ]));
    });
  });
}