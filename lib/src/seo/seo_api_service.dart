import 'package:sharpapi_flutter_client/src/core/SharpApiService.dart';
import 'package:sharpapi_flutter_client/src/core/error/exceptions.dart';
import 'package:sharpapi_flutter_client/src/core/models/general_model.dart';
import 'package:sharpapi_flutter_client/src/core/network/remote/api_endpoints.dart';
import 'package:sharpapi_flutter_client/src/core/network/repository.dart';
import 'package:sharpapi_flutter_client/src/seo/models/generate_seo_tags_model.dart';

class SeoApiService {
  final Repository _repository;
  final SharpApiService _sharpApiService;

  SeoApiService({
    required Repository repository,
    required SharpApiService sharpApiService,
  })  : _repository = repository,
        _sharpApiService = sharpApiService;

  ///*** generate seo tags
  Future<GeneralModel> _generateSeoTags({
    required String content,
    required String language,
    String? voiceTone,
  }) async {
    final result = await _repository.generateSeoTags(
      content: content,
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

  ///*** generate seo tags implementation
  Future<GenerateSeoTagsModel> generateSeoTags({
    required String content,
    required String language,
    String? voiceTone,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _generateSeoTags(
        content: content,
        language: language,
          voiceTone: voiceTone,
      );
    } catch (error) {
      rethrow;
    }

    GenerateSeoTagsModel? generateSeoTagsModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.jobId ?? '',
        mainRoute: generateSeoTagsRoute,
      );

      generateSeoTagsModel = GenerateSeoTagsModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return generateSeoTagsModel;
  }
}