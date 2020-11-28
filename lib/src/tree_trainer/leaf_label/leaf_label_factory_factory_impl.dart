import 'package:ml_algo/src/common/distribution_calculator/distribution_calculator_factory.dart';
import 'package:ml_algo/src/tree_trainer/leaf_label/leaf_label_factory.dart';
import 'package:ml_algo/src/tree_trainer/leaf_label/leaf_label_factory_factory.dart';
import 'package:ml_algo/src/tree_trainer/leaf_label/leaf_label_factory_type.dart';
import 'package:ml_algo/src/tree_trainer/leaf_label/majority_leaf_label_factory.dart';

class TreeLeafLabelFactoryFactoryImpl implements
    TreeLeafLabelFactoryFactory {

  TreeLeafLabelFactoryFactoryImpl(this._distributionCalculatorFactory);

  final DistributionCalculatorFactory
    _distributionCalculatorFactory;

  @override
  TreeLeafLabelFactory createByType(
      TreeLeafLabelFactoryType type) {

    final distributionCalculator = _distributionCalculatorFactory.create();

    switch(type) {
      case TreeLeafLabelFactoryType.majority:
        return MajorityTreeLeafLabelFactory(distributionCalculator);

      default:
        throw UnsupportedError('Decision tree leaf label factory type $type '
            'is not supported');
    }
  }
}
