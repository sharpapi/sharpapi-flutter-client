import 'package:sharpapi_flutter_client/src/core/SharpApiService.dart';
import 'package:sharpapi_flutter_client/src/core/error/exceptions.dart';
import 'package:sharpapi_flutter_client/src/core/models/category_model.dart';
import 'package:sharpapi_flutter_client/src/core/models/general_model.dart';
import 'package:sharpapi_flutter_client/src/core/models/review_sentiment_model.dart';
import 'package:sharpapi_flutter_client/src/core/network/repository.dart';

class TravelTourismHospitalityApiService {
  final Repository _repository;
  final SharpApiService _sharpApiService;

  TravelTourismHospitalityApiService({
    required Repository repository,
    required SharpApiService sharpApiService,
  })  : _repository = repository,
        _sharpApiService = sharpApiService;

  ///*** travel review sentiment
  Future<GeneralModel> _travelReviewSentiment({
    required String content,
    required String language,
  }) async {
    final result = await _repository.travelReviewSentiment(
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

  ///*** travel review sentiment implementation
  Future<ReviewSentimentModel> travelReviewSentiment({
    required String content,
    required String language,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _travelReviewSentiment(
        content: content,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    ReviewSentimentModel? travelReviewSentimentModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.statusUrl != null ? generalModel.statusUrl!.split('status/').last : '',
      );

      travelReviewSentimentModel = ReviewSentimentModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return travelReviewSentimentModel;
  }

  ///*** tours and activities product categories
  Future<GeneralModel> _toursAndActivitiesProductCategories({
    required String content,
    String? city,
    String? country,
    required String language,
  }) async {
    final result = await _repository.toursAndActivitiesProductCategories(
      content: content,
      city: city,
      country: country,
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

  ///*** tours and activities product categories implementation
  Future<List<CategoryModel>> toursAndActivitiesProductCategories({
    required String content,
    String? city,
    String? country,
    required String language,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _toursAndActivitiesProductCategories(
        content: content,
        city: city,
        country: country,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    List<CategoryModel>? toursAndActivitiesProductCategoriesModel;

    try {
      List result = await _sharpApiService.getJobStatusResult<List>(
        jobId: generalModel.statusUrl != null ? generalModel.statusUrl!.split('status/').last : '',
      );

      toursAndActivitiesProductCategoriesModel = result.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return toursAndActivitiesProductCategoriesModel;
  }

  ///*** hospitality product categories
  Future<GeneralModel> _hospitalityProductCategories({
    required String content,
    String? city,
    String? country,
    required String language,
  }) async {
    final result = await _repository.hospitalityProductCategories(
      content: content,
      city: city,
      country: country,
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

  ///*** hospitality product categories implementation
  Future<List<CategoryModel>> hospitalityProductCategories({
    required String content,
    String? city,
    String? country,
    required String language,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _hospitalityProductCategories(
        content: content,
        city: city,
        country: country,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    List<CategoryModel>? hospitalityProductCategoriesModel;

    try {
      List result = await _sharpApiService.getJobStatusResult<List>(
        jobId: generalModel.statusUrl != null ? generalModel.statusUrl!.split('status/').last : '',
      );

      hospitalityProductCategoriesModel = result.map((e) => CategoryModel.fromJson(e)).toList();
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return hospitalityProductCategoriesModel;
  }
}
