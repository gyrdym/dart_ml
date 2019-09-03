import 'dart:collection';
import 'dart:math' as math;

import 'package:ml_algo/src/solver/non_linear/decision_tree/split_assessor/split_assessor.dart';
import 'package:ml_linalg/matrix.dart';
import 'package:ml_linalg/vector.dart';

class MajoritySplitAssessor implements SplitAssessor {
  const MajoritySplitAssessor();

  @override
  double getAggregatedError(Iterable<Matrix> splitObservations, int targetId) {
    int errorCount = 0;
    int totalCount = 0;
    for (final nodeObservations in splitObservations) {
      errorCount += _getErrorCount(nodeObservations
          .getColumn(targetId));
      totalCount += nodeObservations.rowsNum;
    }
    return errorCount / totalCount;
  }

  @override
  double getError(Matrix splitObservations, int targetId) =>
      _getErrorCount(splitObservations.getColumn(targetId)) /
          splitObservations.rowsNum;

  int _getErrorCount(Vector outcomes) {
    if (outcomes.isEmpty) {
      throw Exception('Given node does not have any observations');
    }
    final majorityCount = _getMajorityCount<double>(outcomes);

    return outcomes.length - majorityCount;
  }

  int _getMajorityCount<T>(Iterable<T> iterable) {
    final bins = HashMap<T, int>();
    iterable.forEach((value) =>
        bins.update(value, (existing) => existing + 1, ifAbsent: () => 1));
    return bins.values.reduce(math.max);
  }
}
