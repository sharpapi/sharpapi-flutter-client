import 'package:sharpapi_flutter_client/src/core/SharpApiService.dart';
import 'package:sharpapi_flutter_client/src/core/error/exceptions.dart';
import 'package:sharpapi_flutter_client/src/core/models/category_model.dart';
import 'package:sharpapi_flutter_client/src/core/models/general_model.dart';
import 'package:sharpapi_flutter_client/src/core/models/review_sentiment_model.dart';
import 'package:sharpapi_flutter_client/src/core/network/repository.dart';
import 'package:sharpapi_flutter_client/src/e_commerce/models/product_intro_model.dart';
import 'package:sharpapi_flutter_client/src/e_commerce/models/thank_you_email_model.dart';

class ECommerceApiService {
  final Repository _repository;
  final SharpApiService _sharpApiService;

  ECommerceApiService({
    required Repository repository,
    required SharpApiService sharpApiService,
  })  : _repository = repository,
        _sharpApiService = sharpApiService;

  ///*** product review sentiment
  Future<GeneralModel> _productReviewSentiment({
    required String content,
    required String language,
  }) async {
    final result = await _repository.productReviewSentiment(
      content: content,
      language: language,
    );

    GeneralModel generateJobDescriptionModel = GeneralModel();

    result.fold(
      (error) {
        // log('error2 -> $error');

        throw SharpApiException(error);
      },
      (data) {
        generateJobDescriptionModel = data;
      },
    );

    return generateJobDescriptionModel;
  }

  ///*** product review implementation
  Future<ReviewSentimentModel> productReviewSentiment({
    required String content,
    required String language,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _productReviewSentiment(
        content: content,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    ReviewSentimentModel? productReviewModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.statusUrl != null ? generalModel.statusUrl!.split('status/').last : '',
      );

      productReviewModel = ReviewSentimentModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return productReviewModel;
  }

  ///*** product categories
  Future<GeneralModel> _productCategories({
    required String content,
    required String language,
  }) async {
    final result = await _repository.productCategories(
      content: content,
      language: language,
    );

    GeneralModel generalModel = GeneralModel();

    result.fold(
      (error) {
        // log('error2 -> $error');

        throw SharpApiException(error);
      },
      (data) {
        generalModel = data;
      },
    );

    return generalModel;
  }

  ///*** product categories implementation
  Future<List<CategoryModel>> productCategories({
    required String content,
    required String language,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _productCategories(
        content: content,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    List<CategoryModel>? productCategoriesModel;

    try {
      List result = await _sharpApiService.getJobStatusResult<List>(
        jobId: generalModel.statusUrl != null ? generalModel.statusUrl!.split('status/').last : '',
      );

      productCategoriesModel = (result).map((e) => CategoryModel.fromJson(e)).toList();
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return productCategoriesModel;
  }

  ///*** generate product intro
  Future<GeneralModel> _generateProductIntro({
    required String content,
    required String language,
  }) async {
    final result = await _repository.generateProductIntro(
      content: content,
      language: language,
    );

    GeneralModel generalModel = GeneralModel();

    result.fold(
      (error) {
        // log('error2 -> $error');

        throw SharpApiException(error);
      },
      (data) {
        generalModel = data;
      },
    );

    return generalModel;
  }

  ///*** generate product intro implementation
  Future<ProductIntroModel> generateProductIntro({
    required String content,
    required String language,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _generateProductIntro(
        content: content,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    ProductIntroModel? productIntroModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.statusUrl != null ? generalModel.statusUrl!.split('status/').last : '',
      );

      productIntroModel = ProductIntroModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return productIntroModel;
  }

  ///*** generate thank you email
  Future<GeneralModel> _generateThankYouEmail({
    required String content,
    required String language,
  }) async {
    final result = await _repository.generateThankYouEmail(
      content: content,
      language: language,
    );

    GeneralModel generalModel = GeneralModel();

    result.fold(
      (error) {
        // log('error2 -> $error');

        throw SharpApiException(error);
      },
      (data) {
        generalModel = data;
      },
    );

    return generalModel;
  }

  ///*** generate thank you email implementation
  Future<ThankYouEmailModel> generateThankYouEmail({
    required String content,
    required String language,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _generateThankYouEmail(
        content: content,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    ThankYouEmailModel? thankYouEmailModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.statusUrl != null ? generalModel.statusUrl!.split('status/').last : '',
      );

      thankYouEmailModel = ThankYouEmailModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return thankYouEmailModel;
  }
}
