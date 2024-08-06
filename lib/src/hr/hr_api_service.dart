import 'dart:io';

import 'package:sharpapi_flutter_client/src/core/SharpApiService.dart';
import 'package:sharpapi_flutter_client/src/core/error/exceptions.dart';
import 'package:sharpapi_flutter_client/src/core/models/general_model.dart';
import 'package:sharpapi_flutter_client/src/core/network/remote/api_endpoints.dart';
import 'package:sharpapi_flutter_client/src/core/network/repository.dart';
import 'package:sharpapi_flutter_client/src/hr/dto/generate_job_description_dto.dart';
import 'package:sharpapi_flutter_client/src/hr/models/generate_job_description_model.dart';
import 'package:sharpapi_flutter_client/src/hr/models/parse_resume_model.dart';
import 'package:sharpapi_flutter_client/src/hr/models/related_job_positions_model.dart';
import 'package:sharpapi_flutter_client/src/hr/models/related_skills_model.dart';

class HrApiService {
  final Repository _repository;
  final SharpApiService _sharpApiService;

  HrApiService({
    required Repository repository,
    required SharpApiService sharpApiService,
  })  : _repository = repository,
        _sharpApiService = sharpApiService;

  ///*** generate job description
  Future<GeneralModel> _generateJobDescription({
    required GenerateJobDescriptionDto generateJobDescriptionDto,
  }) async {
    final result = await _repository.generateJobDescription(
      generateJobDescriptionDto: generateJobDescriptionDto,
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

  ///*** generate job description implementation
  Future<GenerateJobDescriptionModel> generateJobDescription({
    required GenerateJobDescriptionDto generateJobDescriptionDto,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _generateJobDescription(generateJobDescriptionDto: generateJobDescriptionDto);
    } catch (error) {
      rethrow;
    }

    GenerateJobDescriptionModel? generateJobDescriptionModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.jobId ?? '',
        mainRoute: generateJobDescriptionRoute,
      );

      generateJobDescriptionModel = GenerateJobDescriptionModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return generateJobDescriptionModel;
  }

  ///*** related skills
  Future<GeneralModel> _relatedSkills({
    required String skill,
    required String language,
    int? maxQuantity,
  }) async {
    final result = await _repository.relatedSkills(
      skill: skill,
      language: language,
      maxQuantity: maxQuantity,
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

  ///*** related skills implementation
  Future<RelatedSkillsModel> relatedSkills({
    required String skill,
    required String language,
    int? maxQuantity,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _relatedSkills(
        skill: skill,
        language: language,
        maxQuantity: maxQuantity,
      );
    } catch (error) {
      rethrow;
    }

    RelatedSkillsModel? relatedSkillsModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.jobId ?? '',
        mainRoute: relatedSkillsRoute,
      );

      relatedSkillsModel = RelatedSkillsModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return relatedSkillsModel;
  }

  ///*** related job positions
  Future<GeneralModel> _relatedJobPositions({
    required String jobTitle,
    required String language,
    int? maxQuantity,
  }) async {
    final result = await _repository.relatedJobPositions(
      jobTitle: jobTitle,
      language: language,
      maxQuantity: maxQuantity,
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

  ///*** related skills implementation
  Future<RelatedJobPositionModel> relatedJobPositions({
    required String jobTitle,
    required String language,
    int? maxQuantity,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _relatedJobPositions(
        jobTitle: jobTitle,
        language: language,
        maxQuantity: maxQuantity,
      );
    } catch (error) {
      rethrow;
    }

    RelatedJobPositionModel? relatedJobPositionModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.jobId ?? '',
        mainRoute: relatedJobPositionsRoute,
      );

      relatedJobPositionModel = RelatedJobPositionModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return relatedJobPositionModel;
  }

  ///*** parse resume
  Future<GeneralModel> _parseResume({
    required File resume,
    required String language,
  }) async {
    final result = await _repository.parseResume(
      resume: resume,
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

  ///*** parse resume implementation
  Future<ParseResumeModel> parseResume({
    required File resume,
    required String language,
  }) async {
    GeneralModel? generalModel;

    try {
      generalModel = await _parseResume(
        resume: resume,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    ParseResumeModel? parseResumeModel;

    try {
      Map<String, dynamic> result = await _sharpApiService.getJobStatusResult<Map<String, dynamic>>(
        jobId: generalModel.jobId ?? '',
        mainRoute: parseResumeRoute,
      );

      parseResumeModel = ParseResumeModel.fromJson(result);
    } catch (error) {
      // log('error => $error');

      rethrow;
    }

    return parseResumeModel;
  }
}
