import 'dart:convert';

import 'package:sharpapi_flutter_client/sharpapi_flutter_client.dart';
import 'package:sharpapi_flutter_client/src/core/enums/job_status_enum.dart';
import 'package:sharpapi_flutter_client/src/core/error/exceptions.dart';
import 'package:sharpapi_flutter_client/src/core/models/job_model.dart';
import 'package:sharpapi_flutter_client/src/core/network/repository.dart';

class SharpApiService {
  final Repository _repository;

  SharpApiService({
    required Repository repository,
  }) : _repository = repository;

  Future<JobModel> _getJobStatusResult({
    required String jobId,
  }) async {
    final result = await _repository.getJobStatusResult(
      jobId: jobId,
    );

    JobModel jobModel = JobModel();

    result.fold(
      (error) {
        // log('error: $error');
        throw SharpApiException(error);
      },
      (data) {
        jobModel = data;
      },
    );

    return jobModel;
  }

  Future<T> getJobStatusResult<T>({
    required String jobId,
  }) async {
    double waitingTime = 0;

    T returnModel;

    try {
      JobModel jobModel = await _getJobStatusResult(
        jobId: jobId,
      );

      // log('jobModel.result => ${jobModel.status}');

      if (jobModel.status == SharpApiJobStatusEnum.NEW.label ||
          jobModel.status == SharpApiJobStatusEnum.PENDING.label) {

        waitingTime = waitingTime + SharpApiConfigs.apiJobStatusPollingInterval;

        if(waitingTime >= SharpApiConfigs.apiJobStatusPollingWait) {
          throw SharpApiException('Job status polling timeout!, Please try again.');
        } else {
          await Future.delayed(Duration(seconds: SharpApiConfigs.apiJobStatusPollingInterval.toInt()));

          return getJobStatusResult<T>(
            jobId: jobId,
          );
        }
      } else {
        if (jobModel.result != null) {
          returnModel = jsonDecode(jobModel.result!);
        } else {
          throw SharpApiException('Something went wrong! Please try again with the same data or you can do some changes.');
        }
      }
    } catch (error) {
      // log('error => $error');
      rethrow;
    }

    return returnModel;
  }
}