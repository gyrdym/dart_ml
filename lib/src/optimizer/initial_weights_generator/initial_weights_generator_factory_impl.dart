import 'package:ml_algo/src/optimizer/initial_weights_generator/initial_weights_generator.dart';
import 'package:ml_algo/src/optimizer/initial_weights_generator/initial_weights_generator_factory.dart';
import 'package:ml_algo/src/optimizer/initial_weights_generator/initial_weights_type.dart';
import 'package:ml_algo/src/optimizer/initial_weights_generator/zero_weights_generator.dart';

class InitialWeightsGeneratorFactoryImpl
    implements InitialWeightsGeneratorFactory {
  const InitialWeightsGeneratorFactoryImpl();

  @override
  InitialWeightsGenerator zeroes(Type dtype) => ZeroWeightsGenerator(dtype);

  @override
  InitialWeightsGenerator fromType(InitialWeightsType type, Type dtype) {
    switch (type) {
      case InitialWeightsType.zeroes:
        return zeroes(dtype);
      default:
        throw UnsupportedError('Unsupported initial weights type - $type');
    }
  }
}