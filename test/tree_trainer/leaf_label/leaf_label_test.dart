import 'package:ml_algo/src/tree_trainer/leaf_label/leaf_label.dart';
import 'package:test/test.dart';

void main() {
  group('TreeLeafLabel', () {
    test('should throw an exception if probability is less than 0', () {
      final labelValue = 5;
      final probability = -0.001;

      expect(() => TreeLeafLabel(labelValue, probability: probability),
          throwsRangeError);
    });

    test('should allow probability to be negative with small penalty', () {
      final labelValue = 5;
      final probability = -1e-5;
      final label = TreeLeafLabel(labelValue, probability: probability);

      expect(label.probability, probability);
    });

    test('should throw an exception if probability is greater than 1', () {
      final labelValue = -1e5;
      final probability = 1.001;

      expect(() => TreeLeafLabel(labelValue, probability: probability),
          throwsRangeError);
    });

    test('should allow probability to be greater than 1 with small penalty', () {
      final labelValue = 5;
      final probability = 1 + 1e-5;
      final label = TreeLeafLabel(labelValue, probability: probability);

      expect(label.probability, probability);
    });

    test('should allow probability to be 0', () {
      final labelValue = 5;
      final probability = 0;
      final label = TreeLeafLabel(labelValue, probability: probability);

      expect(label.probability, probability);
    });

    test('should allow probability to be 1', () {
      final labelValue = 5;
      final probability = 1;
      final label = TreeLeafLabel(labelValue, probability: probability);

      expect(label.probability, probability);
    });

    test('should store value', () {
      final labelValue = -1e5;
      final probability = 0.3;
      final leafLabel = TreeLeafLabel(labelValue, probability: probability);

      expect(leafLabel.value, labelValue);
    });

    test('should store probability', () {
      final labelValue = -1e5;
      final probability = 0.3;
      final leafLabel = TreeLeafLabel(labelValue, probability: probability);

      expect(leafLabel.probability, probability);
    });

    test('should serialize itself (probability value is null)', () {
      final labelValue = 1000;
      final leafLabel = TreeLeafLabel(labelValue);
      final serialized = leafLabel.toJson();

      expect(serialized, equals({
        'V': labelValue,
        'P': null,
      }));
    });

    test('should serialize itself (probability value is not null)', () {
      final labelValue = -1000;
      final probability = 0.7;
      final leafLabel = TreeLeafLabel(labelValue, probability: probability);
      final serialized = leafLabel.toJson();

      expect(serialized, equals({
        'V': labelValue,
        'P': probability,
      }));
    });
  });
}
