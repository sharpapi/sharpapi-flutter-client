import 'package:sharpapi_flutter_client/src/content_and_marketing/models/detect_spam_model.dart';
import 'package:sharpapi_flutter_client/src/content_and_marketing/models/keywords_and_tags_model.dart';
import 'package:sharpapi_flutter_client/src/content_and_marketing/models/paraphrase_content_model.dart';
import 'package:sharpapi_flutter_client/src/content_and_marketing/models/phone_model.dart';
import 'package:sharpapi_flutter_client/src/content_and_marketing/models/proofread_content_model.dart';
import 'package:sharpapi_flutter_client/src/content_and_marketing/models/summarize_content_model.dart';
import 'package:sharpapi_flutter_client/src/content_and_marketing/models/translate_text_model.dart';
import 'package:sharpapi_flutter_client/src/core/SharpApiService.dart';
import 'package:sharpapi_flutter_client/src/core/error/exceptions.dart';
import 'package:sharpapi_flutter_client/src/core/models/general_model.dart';
import 'package:sharpapi_flutter_client/src/core/network/remote/api_endpoints.dart';
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
    String? voiceTone,
    String? context,
  }) async {
    final result = await _repository.translate(
      text: text,
      language: language,
      voiceTone: voiceTone,
      context: context,
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
    String? voiceTone,
    String? context,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _translate(
        text: text,
        language: language,
        voiceTone: voiceTone,
        context: context,
      );
    } catch (error) {
      rethrow;
    }

    TranslateTextModel? translateModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.jobId ?? '',
        mainRoute: translateTextRoute,
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
        jobId: generalModel.jobId ?? '',
        mainRoute: detectSpamRoute,
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
        jobId: generalModel.jobId ?? '',
        mainRoute: detectPhonesRoute,
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
        jobId: generalModel.jobId ?? '',
        mainRoute: detectEmailsRoute,
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
    int? maxLength,
    String? voiceTone,
  }) async {
    final result = await _repository.summarizeText(
      content: text,
      language: language,
      maxLength: maxLength,
      voiceTone: voiceTone,
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
    int? maxLength,
    String? voiceTone,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _summarizeText(
        text: text,
        language: language,
        maxLength: maxLength,
        voiceTone: voiceTone,
      );
    } catch (error) {
      rethrow;
    }

    SummarizeContentModel? summarizeTextModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.jobId ?? '',
        mainRoute: summarizeTextRoute,
      );

      summarizeTextModel = SummarizeContentModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return summarizeTextModel;
  }

  ///*** paraphrase content
  Future<GeneralModel> _paraphraseText({
    required String text,
    required String language,
    String? voiceTone,
    int? maxLength,
    String? context,
  }) async {
    final result = await _repository.paraphraseText(
      content: text,
      language: language,
      voiceTone: voiceTone,
      maxLength: maxLength,
      context: context,
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

  ///*** paraphrase content implementation
  Future<ParaphraseContentModel> paraphraseText({
    required String text,
    required String language,
    String? voiceTone,
    int? maxLength,
    String? context,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _paraphraseText(
        text: text,
        language: language,
        voiceTone: voiceTone,
        maxLength: maxLength,
        context: context,
      );
    } catch (error) {
      rethrow;
    }

    ParaphraseContentModel? paraphraseContentModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.jobId ?? '',
        mainRoute: paraphraseTextRoute,
      );

      paraphraseContentModel = ParaphraseContentModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return paraphraseContentModel;
  }

  ///*** proofread content
  Future<GeneralModel> _proofreadText({
    required String content,
  }) async {
    final result = await _repository.proofreadText(
      content: content,
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

  ///*** proofread content implementation
  Future<ProofreadContentModel> proofreadText({
    required String content,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _proofreadText(
        content: content,
      );
    } catch (error) {
      rethrow;
    }

    ProofreadContentModel? proofreadContentModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.jobId ?? '',
        mainRoute: proofreadTextRoute,
      );

      proofreadContentModel = ProofreadContentModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return proofreadContentModel;
  }

  ///*** generate keywords
  Future<GeneralModel> _generateKeywords({
    required String text,
    required String language,
    String? voiceTone,
  }) async {
    final result = await _repository.generateKeywords(
      content: text,
      language: language,
      voiceTone: voiceTone,
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

  ///*** generate keywords implementation
  Future<KeywordsAndTagsModel> generateKeywords({
    required String text,
    required String language,
    String? voiceTone,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _generateKeywords(
        text: text,
        language: language,
        voiceTone: voiceTone,
      );
    } catch (error) {
      rethrow;
    }

    KeywordsAndTagsModel? generateKeywordsModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.jobId ?? '',
        mainRoute: generateKeywordsRoute,
      );

      generateKeywordsModel = KeywordsAndTagsModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return generateKeywordsModel;
  }
}