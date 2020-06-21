import 'package:ml_algo/src/model_selection/split_indices_provider/data_splitter.dart';
import 'package:ml_algo/src/model_selection/split_indices_provider/data_splitter_factory.dart';
import 'package:ml_algo/src/model_selection/split_indices_provider/data_splitter_type.dart';
import 'package:ml_algo/src/model_selection/split_indices_provider/k_fold_data_splitter.dart';
import 'package:ml_algo/src/model_selection/split_indices_provider/leave_p_out_data_splitter.dart';

class DataSplitterFactoryImpl implements DataSplitterFactory {
  const DataSplitterFactoryImpl();

  @override
  DataSplitter createByType(DataSplitterType splitterType, {
    int numberOfFolds,
    int p,
  }) {
    switch (splitterType) {
      case DataSplitterType.kFold:
        if (numberOfFolds == null) {
          throw Exception('Number of folds is not defined for K-fold splitter');
        }
        return KFoldDataSplitter(numberOfFolds);

      case DataSplitterType.lpo:
        if (p == null) {
          throw Exception('`p` parameter is not defined for leave-p-out '
              'splitter');
        }
        return LeavePOutDataSplitter(p);

      default:
        throw UnimplementedError('Splitter of type $splitterType is not '
            'implemented yet');
    }
  }
}
