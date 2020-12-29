import 'package:ml_algo/src/model_selection/cross_validator/cross_validator_isolate_message.dart';

num assessPredictor(Map<String, dynamic> encodedMessage) {
  final message = CrossValidatorIsolateMessage
      .fromJson(encodedMessage);
  final predictor = message
      .predictorPrototype
      .retrain(message.trainData);

  return predictor
      .assess(message.testData, message.metricType);
}
