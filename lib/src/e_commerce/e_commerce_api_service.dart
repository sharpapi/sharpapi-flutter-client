import 'package:sharpapi_flutter_client/src/core/SharpApiService.dart';
import 'package:sharpapi_flutter_client/src/core/error/exceptions.dart';
import 'package:sharpapi_flutter_client/src/core/models/category_model.dart';
import 'package:sharpapi_flutter_client/src/core/models/general_model.dart';
import 'package:sharpapi_flutter_client/src/core/models/review_sentiment_model.dart';
import 'package:sharpapi_flutter_client/src/core/network/remote/api_endpoints.dart';
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
        jobId: generalModel.jobId ?? '',
        mainRoute: productReviewSentimentRoute,
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
    int? maxQuantity,
    String? voiceTone,
    String? context,
  }) async {
    final result = await _repository.productCategories(
      content: content,
      language: language,
      maxQuantity: maxQuantity,
      voiceTone: voiceTone,
      context: context,
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
    int? maxQuantity,
    String? voiceTone,
    String? context,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _productCategories(
        content: content,
        language: language,
        maxQuantity: maxQuantity,
        voiceTone: voiceTone,
        context: context,
      );
    } catch (error) {
      rethrow;
    }

    List<CategoryModel>? productCategoriesModel;

    try {
      List result = await _sharpApiService.getJobStatusResult<List>(
        jobId: generalModel.jobId ?? '',
        mainRoute: productCategoriesRoute,
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
    int? maxLength,
    String? voiceTone,
  }) async {
    final result = await _repository.generateProductIntro(
      content: content,
      language: language,
      maxLength: maxLength,
      voiceTone: voiceTone,
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
    int? maxLength,
    String? voiceTone,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _generateProductIntro(
        content: content,
        language: language,
        maxLength: maxLength,
        voiceTone: voiceTone,
      );
    } catch (error) {
      rethrow;
    }

    ProductIntroModel? productIntroModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.jobId ?? '',
        mainRoute: generateProductIntroRoute,
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
    int? maxLength,
    String? voiceTone,
    String? context,
  }) async {
    final result = await _repository.generateThankYouEmail(
      content: content,
      language: language,
      maxLength: maxLength,
      voiceTone: voiceTone,
      context: context,
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
    int? maxLength,
    String? voiceTone,
    String? context,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _generateThankYouEmail(
        content: content,
        language: language,
        maxLength: maxLength,
        voiceTone: voiceTone,
        context: context,
      );
    } catch (error) {
      rethrow;
    }

    ThankYouEmailModel? thankYouEmailModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.jobId ?? '',
        mainRoute: generateThankYouEmailRoute,
      );

      thankYouEmailModel = ThankYouEmailModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return thankYouEmailModel;
  }
}
