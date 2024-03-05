import 'package:sharpapi_flutter_client/src/content_and_marketing/models/detect_spam_model.dart';
import 'package:sharpapi_flutter_client/src/content_and_marketing/models/keywords_and_tags_model.dart';
import 'package:sharpapi_flutter_client/src/content_and_marketing/models/phone_model.dart';
import 'package:sharpapi_flutter_client/src/content_and_marketing/models/summarize_content_model.dart';
import 'package:sharpapi_flutter_client/src/content_and_marketing/models/translate_text_model.dart';
import 'package:sharpapi_flutter_client/src/core/SharpApiService.dart';
import 'package:sharpapi_flutter_client/src/core/error/exceptions.dart';
import 'package:sharpapi_flutter_client/src/core/models/general_model.dart';
import 'package:sharpapi_flutter_client/src/core/network/repository.dart';

class ContentAndMarketingApiService {
  final Repository _repository;
  final SharpApiService _sharpApiService;

  ContentAndMarketingApiService({
    required Repository repository,
    required SharpApiService sharpApiService,
  })  : _repository = repository,
        _sharpApiService = sharpApiService;

  ///*** translate text
  Future<GeneralModel> _translate({
    required String text,
    required String language,
  }) async {
    final result = await _repository.translate(
      text: text,
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

  ///*** translate text implementation
  Future<TranslateTextModel> translate({
    required String text,
    required String language,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _translate(
        text: text,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    TranslateTextModel? translateModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.statusUrl != null ? generalModel.statusUrl!.split('status/').last : '',
      );

      translateModel = TranslateTextModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return translateModel;
  }

  ///*** detect spam
  Future<GeneralModel> _detectSpam({
    required String text,
  }) async {
    final result = await _repository.detectSpam(
      content: text,
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

  ///*** detect spam implementation
  Future<DetectSpamModel> detectSpam({
    required String text,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _detectSpam(
        text: text,
      );
    } catch (error) {
      rethrow;
    }

    DetectSpamModel? detectSpamModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.statusUrl != null ? generalModel.statusUrl!.split('status/').last : '',
      );

      detectSpamModel = DetectSpamModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return detectSpamModel;
  }

  ///*** detect phone numbers
  Future<GeneralModel> _detectPhones({
    required String text,
  }) async {
    final result = await _repository.detectPhones(
      content: text,
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

  ///*** detect phone numbers implementation
  Future<List<PhoneNumberModel>> detectPhones({
    required String text,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _detectPhones(
        text: text,
      );
    } catch (error) {
      rethrow;
    }

    List<PhoneNumberModel>? detectPhonesModel;

    try {
      List result = await _sharpApiService.getJobStatusResult<List>(
        jobId: generalModel.statusUrl != null ? generalModel.statusUrl!.split('status/').last : '',
      );

      detectPhonesModel = result.map((e) => PhoneNumberModel.fromJson(e)).toList();
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return detectPhonesModel;
  }

  ///*** detect emails
  Future<GeneralModel> _detectEmails({
    required String text,
  }) async {
    final result = await _repository.detectEmails(
      content: text,
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

  ///*** detect emails implementation
  Future<List<String>> detectEmails({
    required String text,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _detectEmails(
        text: text,
      );
    } catch (error) {
      rethrow;
    }

    List<String>? detectEmailsModel;

    try {
      List result = await _sharpApiService.getJobStatusResult<List>(
        jobId: generalModel.statusUrl != null ? generalModel.statusUrl!.split('status/').last : '',
      );

      detectEmailsModel = result.map((e) => e.toString()).toList();
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return detectEmailsModel;
  }

  ///*** summarize text
  Future<GeneralModel> _summarizeText({
    required String text,
    required String language,
  }) async {
    final result = await _repository.summarizeText(
      content: text,
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

  ///*** summarize text implementation
  Future<SummarizeContentModel> summarizeText({
    required String text,
    required String language,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _summarizeText(
        text: text,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    SummarizeContentModel? summarizeTextModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.statusUrl != null ? generalModel.statusUrl!.split('status/').last : '',
      );

      summarizeTextModel = SummarizeContentModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return summarizeTextModel;
  }

  ///*** generate keywords
  Future<GeneralModel> _generateKeywords({
    required String text,
    required String language,
  }) async {
    final result = await _repository.generateKeywords(
      content: text,
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

  ///*** summarize text implementation
  Future<KeywordsAndTagsModel> generateKeywords({
    required String text,
    required String language,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _generateKeywords(
        text: text,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    KeywordsAndTagsModel? generateKeywordsModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.statusUrl != null ? generalModel.statusUrl!.split('status/').last : '',
      );

      generateKeywordsModel = KeywordsAndTagsModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return generateKeywordsModel;
  }
}