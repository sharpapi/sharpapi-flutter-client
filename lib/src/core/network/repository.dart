import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sharpapi_flutter_client/sharpapi_flutter_client.dart';
import 'package:sharpapi_flutter_client/src/core/error/exceptions.dart';
import 'package:sharpapi_flutter_client/src/core/models/general_model.dart';
import 'package:sharpapi_flutter_client/src/core/models/job_model.dart';
import 'package:sharpapi_flutter_client/src/core/network/remote/api_endpoints.dart';
import 'package:sharpapi_flutter_client/src/core/network/remote/dio_helper.dart';
import 'package:sharpapi_flutter_client/src/hr/dto/generate_job_description_dto.dart';
import 'package:sharpapi_flutter_client/src/subscription_info/models/ping_model.dart';
import 'package:sharpapi_flutter_client/src/subscription_info/models/quota_model.dart';

abstract class Repository {
  Future<Either<String, JobModel>> getJobStatusResult({
    required String jobId,
    required String mainRoute,
  });

  Future<Either<String, GeneralModel>> generateJobDescription({
    required GenerateJobDescriptionDto generateJobDescriptionDto,
  });

  Future<Either<String, GeneralModel>> relatedSkills({
    required String skill,
    required String language,
    int? maxQuantity,
  });

  Future<Either<String, GeneralModel>> relatedJobPositions({
    required String jobTitle,
    required String language,
    int? maxQuantity,
  });

  Future<Either<String, GeneralModel>> parseResume({
    required File resume,
    required String language,
  });

  Future<Either<String, GeneralModel>> productReviewSentiment({
    required String content,
    required String language,
  });

  Future<Either<String, GeneralModel>> productCategories({
    required String content,
    required String language,
    int? maxQuantity,
    String? voiceTone,
    String? context,
  });

  Future<Either<String, GeneralModel>> generateProductIntro({
    required String content,
    required String language,
    int? maxLength,
    String? voiceTone,
  });

  Future<Either<String, GeneralModel>> generateThankYouEmail({
    required String content,
    required String language,
    int? maxLength,
    String? voiceTone,
    String? context,
  });

  Future<Either<String, GeneralModel>> generateSeoTags({
    required String content,
    required String language,
    String? voiceTone,
  });

  Future<Either<String, GeneralModel>> travelReviewSentiment({
    required String content,
    required String language,
  });

  Future<Either<String, GeneralModel>> toursAndActivitiesProductCategories({
    required String content,
    String? city,
    String? country,
    required String language,
    int? maxQuantity,
    String? voiceTone,
    String? context,
  });

  Future<Either<String, GeneralModel>> hospitalityProductCategories({
    required String content,
    String? city,
    String? country,
    required String language,
    int? maxQuantity,
    String? voiceTone,
    String? context,
  });

  Future<Either<String, GeneralModel>> translate({
    required String text,
    required String language,
    String? voiceTone,
    String? context,
  });

  Future<Either<String, GeneralModel>> detectSpam({
    required String content,
  });

  Future<Either<String, GeneralModel>> detectPhones({
    required String content,
  });

  Future<Either<String, GeneralModel>> detectEmails({
    required String content,
  });

  Future<Either<String, GeneralModel>> summarizeText({
    required String content,
    required String language,
    int? maxLength,
    String? voiceTone,
  });

  Future<Either<String, GeneralModel>> paraphraseText({
    required String content,
    required String language,
    String? voiceTone,
    int? maxLength,
    String? context,
  });

  Future<Either<String, GeneralModel>> proofreadText({
    required String content,
  });

  Future<Either<String, GeneralModel>> generateKeywords({
    required String content,
    required String language,
    String? voiceTone,
  });

  Future<Either<String, QuotaModel>> quota();

  Future<Either<String, PingModel>> ping();
}

class RepoImplementation extends Repository {
  final DioHelper dioHelper;

  RepoImplementation({
    required this.dioHelper,
  });

  ///*** ping
  @override
  Future<Either<String, PingModel>> ping() async {
    return _basicErrorHandling<PingModel>(
      onSuccess: () async {
        final Response f = await dioHelper.get(
          url: pingRoute,
          token: SharpApiConfigs.apiKey,
        );

        // log('summarize text: ${f.data}');

        return PingModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** get quota
  @override
  Future<Either<String, QuotaModel>> quota() async {
    return _basicErrorHandling<QuotaModel>(
      onSuccess: () async {
        final Response f = await dioHelper.get(
          url: quotaRoute,
          token: SharpApiConfigs.apiKey,
        );

        // log('summarize text: ${f.data}');

        return QuotaModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** generate keywords
  @override
  Future<Either<String, GeneralModel>> generateKeywords({
    required String content,
    required String language,
    String? voiceTone,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(url: generateKeywordsRoute, token: SharpApiConfigs.apiKey, data: {
          'content': content,
          'language': language,
          if (voiceTone != null) 'voice_tone': voiceTone,
        });

        // log('generate keywords: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** summarize text
  @override
  Future<Either<String, GeneralModel>> summarizeText({
    required String content,
    required String language,
    int? maxLength,
    String? voiceTone,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(url: summarizeTextRoute, token: SharpApiConfigs.apiKey, data: {
          'content': content,
          'language': language,
          if (maxLength != null) 'max_length': maxLength,
          if (voiceTone != null) 'voice_tone': voiceTone,
        });

        // log('summarize text: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** paraphrase text
  @override
  Future<Either<String, GeneralModel>> paraphraseText({
    required String content,
    required String language,
    String? voiceTone,
    int? maxLength,
    String? context,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(
          url: paraphraseTextRoute,
          token: SharpApiConfigs.apiKey,
          data: {
            'content': content,
            'language': language,
            if (voiceTone != null) 'voice_tone': voiceTone,
            if (maxLength != null) 'max_length': maxLength,
            if (context != null) 'context': context,
          },
        );

        // log('summarize text: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** proofread text
  @override
  Future<Either<String, GeneralModel>> proofreadText({
    required String content,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(
          url: proofreadTextRoute,
          token: SharpApiConfigs.apiKey,
          data: {
            'content': content,
          },
        );

        // log('summarize text: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** detect emails
  @override
  Future<Either<String, GeneralModel>> detectEmails({
    required String content,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(url: detectEmailsRoute, token: SharpApiConfigs.apiKey, data: {
          'content': content,
        });

        // log('detect emails: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** detect phones
  @override
  Future<Either<String, GeneralModel>> detectPhones({
    required String content,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(url: detectPhonesRoute, token: SharpApiConfigs.apiKey, data: {
          'content': content,
        });

        // log('detect phones: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** detect spam
  @override
  Future<Either<String, GeneralModel>> detectSpam({
    required String content,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(url: detectSpamRoute, token: SharpApiConfigs.apiKey, data: {
          'content': content,
        });

        // log('generate job description: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** translate
  @override
  Future<Either<String, GeneralModel>> translate({
    required String text,
    required String language,
    String? voiceTone,
    String? context,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(url: translateTextRoute, token: SharpApiConfigs.apiKey, data: {
          'content': text,
          'language': language,
          if (voiceTone != null) 'voice_tone': voiceTone,
          if (context != null) 'context': context,
        });

        // log('generate job description: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** hospitality product categories
  @override
  Future<Either<String, GeneralModel>> hospitalityProductCategories({
    required String content,
    String? city,
    String? country,
    required String language,
    int? maxQuantity,
    String? voiceTone,
    String? context,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(url: hospitalityProductCategoriesRoute, token: SharpApiConfigs.apiKey, data: {
          'content': content,
          if (city != null) 'city': city,
          if (country != null) 'country': country,
          'language': language,
          if (maxQuantity != null) 'max_quantity': maxQuantity,
          if (voiceTone != null) 'voice_tone': voiceTone,
          if (context != null) 'context': context,
        });

        // log('generate job description: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** tours and activities product categories
  @override
  Future<Either<String, GeneralModel>> toursAndActivitiesProductCategories({
    required String content,
    String? city,
    String? country,
    required String language,
    int? maxQuantity,
    String? voiceTone,
    String? context,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(url: toursAndActivitiesProductCategoriesRoute, token: SharpApiConfigs.apiKey, data: {
          'content': content,
          if (city != null) 'city': city,
          if (country != null) 'country': country,
          'language': language,
          if (maxQuantity != null) 'max_quantity': maxQuantity,
          if (voiceTone != null) 'voice_tone': voiceTone,
          if (context != null) 'context': context,
        });

        // log('generate job description: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** travel review sentiment
  @override
  Future<Either<String, GeneralModel>> travelReviewSentiment({
    required String content,
    required String language,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(url: travelReviewSentimentRoute, token: SharpApiConfigs.apiKey, data: {
          'content': content,
          'language': language,
        });

        // log('generate job description: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** generate seo tags
  @override
  Future<Either<String, GeneralModel>> generateSeoTags({
    required String content,
    required String language,
    String? voiceTone,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(url: generateSeoTagsRoute, token: SharpApiConfigs.apiKey, data: {
          'content': content,
          'language': language,
          if (voiceTone != null) 'voice_tone': voiceTone,
        });

        // log('generate job description: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** generate thank you email
  @override
  Future<Either<String, GeneralModel>> generateThankYouEmail({
    required String content,
    required String language,
    int? maxLength,
    String? voiceTone,
    String? context,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(url: generateThankYouEmailRoute, token: SharpApiConfigs.apiKey, data: {
          'content': content,
          'language': language,
          if (maxLength != null) 'max_length': maxLength,
          if (voiceTone != null) 'voice_tone': voiceTone,
          if (context != null) 'context': context,
        });

        // log('generate job description: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** generate product intro
  @override
  Future<Either<String, GeneralModel>> generateProductIntro({
    required String content,
    required String language,
    int? maxLength,
    String? voiceTone,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(url: generateProductIntroRoute, token: SharpApiConfigs.apiKey, data: {
          'content': content,
          'language': language,
          if (maxLength != null) 'max_length': maxLength,
          if (voiceTone != null) 'voice_tone': voiceTone,
        });

        // log('generate job description: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** product categories
  @override
  Future<Either<String, GeneralModel>> productCategories({
    required String content,
    required String language,
    int? maxQuantity,
    String? voiceTone,
    String? context,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(url: productCategoriesRoute, token: SharpApiConfigs.apiKey, data: {
          'content': content,
          'language': language,
          if (maxQuantity != null) 'max_quantity': maxQuantity,
          if (voiceTone != null) 'voice_tone': voiceTone,
          if (context != null) 'context': context,
        });

        // log('generate job description: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** product review sentiment
  @override
  Future<Either<String, GeneralModel>> productReviewSentiment({
    required String content,
    required String language,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(url: productReviewSentimentRoute, token: SharpApiConfigs.apiKey, data: {
          'content': content,
          'language': language,
        });

        // log('generate job description: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** parse resume
  @override
  Future<Either<String, GeneralModel>> parseResume({
    required File resume,
    required String language,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(
          url: parseResumeRoute,
          token: SharpApiConfigs.apiKey,
          isMultipart: true,
          timeOut: const Duration(seconds: 180),
          data: FormData.fromMap({
            'file': await MultipartFile.fromFile(
              resume.path,
              filename: Uri.file(resume.path).pathSegments.last,
            ),
            'language': language,
          }),
        );

        // log('generate job description: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** get related job positions from job title
  @override
  Future<Either<String, GeneralModel>> relatedJobPositions({
    required String jobTitle,
    required String language,
    int? maxQuantity,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(url: relatedJobPositionsRoute, token: SharpApiConfigs.apiKey, data: {
          'content': jobTitle,
          'language': language,
          if (maxQuantity != null) 'max_quantity': maxQuantity,
        });

        // log('generate job description: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** get related skills from skill
  @override
  Future<Either<String, GeneralModel>> relatedSkills({
    required String skill,
    required String language,
    int? maxQuantity,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(url: relatedSkillsRoute, token: SharpApiConfigs.apiKey, data: {
          'content': skill,
          'language': language,
          if (maxQuantity != null) 'max_quantity': maxQuantity,
        });

        // log('generate job description: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** generate job description from some data
  @override
  Future<Either<String, GeneralModel>> generateJobDescription({
    required GenerateJobDescriptionDto generateJobDescriptionDto,
  }) async {
    return _basicErrorHandling<GeneralModel>(
      onSuccess: () async {
        final Response f = await dioHelper.post(
          url: generateJobDescriptionRoute,
          token: SharpApiConfigs.apiKey,
          data: generateJobDescriptionDto.toJson(),
        );

        // log('generate job description: ${f.data}');

        return GeneralModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        // log('errorFromRepo => ${exception.message}');

        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }

  ///*** get job status result from job id
  @override
  Future<Either<String, JobModel>> getJobStatusResult({
    required String jobId,
    required String mainRoute,
  }) async {
    return _basicErrorHandling<JobModel>(
      onSuccess: () async {
        final Response f = await dioHelper.get(
          url: '$mainRoute/$jobStatusRoute/$jobId',
          token: SharpApiConfigs.apiKey,
        );

        // log('job status headers => ${f.headers}');
        // log('job status result: ${f.data}');

        return JobModel.fromJson(f.data);
      },
      onServerError: (exception) async {
        return exception.message;
      },
      onOtherError: (exception) async {
        return exception.token;
      },
    );
  }
}

extension on Repository {
  Future<Either<String, T>> _basicErrorHandling<T>({
    required Future<T> Function() onSuccess,
    Future<String> Function(ServerException exception)? onServerError,
    Future<String> Function(CacheException exception)? onCacheError,
    Future<String> Function(dynamic exception)? onOtherError,
  }) async {
    try {
      final f = await onSuccess();
      return Right(f);
    } on ServerException catch (e) {
      if (onServerError != null) {
        final f = await onServerError(e);
        return Left(f);
      }
      return const Left('Server Error');
    } on CacheException catch (e) {
      if (onCacheError != null) {
        final f = await onCacheError(e);
        return Left(f);
      }
      return const Left('Cache Error');
    } catch (e) {
      if (onOtherError != null) {
        final f = await onOtherError(e);
        return Left(f);
      }
      return Left(e.toString());
    }
  }
}
