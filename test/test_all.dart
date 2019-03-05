import 'classifier/logistic_regressor_integration_test.dart'
    as logistic_regressor_integration_test;
import 'classifier/logistic_regressor_test.dart' as logistic_regressor_test;
import 'classifier/softmax_regressor_test.dart' as softmax_regressor_test;
import 'cost_function/cost_function_test.dart' as cost_function_test;
import 'data_preprocessing/categorical_encoder/category_values_extractor_impl_test.dart'
    as cat_value_extractor_test;
import 'data_preprocessing/categorical_encoder/one_hot_encoder_test.dart'
    as one_hot_encoder_test;
import 'data_preprocessing/categorical_encoder/ordinal_encoder_test.dart'
    as ordinal_encoder_test;
import 'data_preprocessing/intercept_preprocessor_test.dart'
    as intercept_preprocessor_test;
import 'data_preprocessing/data_frame/csv_data_frame_integration_test.dart'
    as csv_ml_data_integration_test;
import 'data_preprocessing/data_frame/csv_data_frame_with_categories_integration_test.dart'
    as csv_ml_data_with_cat_test;
import 'data_preprocessing/data_frame/encoders_processor_impl_test.dart'
    as ml_data_enc_preprocessor_test;
import 'data_preprocessing/data_frame/features_extractor_impl_test.dart'
    as ml_data_feature_extractor_test;
import 'data_preprocessing/data_frame/labels_extractor_impl_test.dart'
    as ml_data_labels_extractor_test;
import 'data_preprocessing/data_frame/params_validator_impl_test.dart'
    as ml_data_params_validator_test;
import 'data_preprocessing/data_frame/read_mask_creator_impl_test.dart'
    as ml_data_read_mask_creator_test;
import 'data_splitter/data_splitter_test.dart' as data_splitter_test;
import 'math/randomizer_test.dart' as randomizer_test;
import 'optimizer/convergence_detector/convergence_detector_impl_test.dart'
    as convergence_detector_test;
import 'optimizer/coordinate/coordinate_optimizer_integration_test.dart'
    as coord_optimizer_integration_test;
import 'optimizer/gradient/gradient_optimizer_integration_test.dart'
    as gradient_optimizer_integration_test;
import 'optimizer/gradient/gradient_optimizer_test.dart'
    as gradient_optimizer_test;
import 'score_to_prob_mapper/score_to_prob_mapper_test.dart'
    as score_to_prob_mapper_test;

void main() {
  logistic_regressor_integration_test.main();
  logistic_regressor_test.main();
  softmax_regressor_test.main();
  cost_function_test.main();
  cat_value_extractor_test.main();
  one_hot_encoder_test.main();
  ordinal_encoder_test.main();
  csv_ml_data_integration_test.main();
  csv_ml_data_with_cat_test.main();
  ml_data_enc_preprocessor_test.main();
  ml_data_feature_extractor_test.main();
  ml_data_labels_extractor_test.main();
  ml_data_params_validator_test.main();
  ml_data_read_mask_creator_test.main();
  intercept_preprocessor_test.main();
  data_splitter_test.main();
  randomizer_test.main();
  convergence_detector_test.main();
  coord_optimizer_integration_test.main();
  gradient_optimizer_integration_test.main();
  gradient_optimizer_test.main();
  score_to_prob_mapper_test.main();
}
