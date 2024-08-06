import 'package:sharpapi_flutter_client/src/core/SharpApiService.dart';
import 'package:sharpapi_flutter_client/src/core/error/exceptions.dart';
import 'package:sharpapi_flutter_client/src/core/models/category_model.dart';
import 'package:sharpapi_flutter_client/src/core/models/general_model.dart';
import 'package:sharpapi_flutter_client/src/core/models/review_sentiment_model.dart';
import 'package:sharpapi_flutter_client/src/core/network/remote/api_endpoints.dart';
import 'package:sharpapi_flutter_client/src/core/network/repository.dart';
import 'package:sharpapi_flutter_client/src/e_commerce/models/product_intro_model.dart';
import 'package:sharpapi_flutter_client/src/e_commerce/models/thank_you_email_model.dart';
import 'package:sharpapi_flutter_client/src/subscription_info/models/ping_model.dart';
import 'package:sharpapi_flutter_client/src/subscription_info/models/ping_model.dart';
import 'package:sharpapi_flutter_client/src/subscription_info/models/quota_model.dart';

class SubscriptionInfoApiService {
  final Repository _repository;
  final SharpApiService _sharpApiService;

  SubscriptionInfoApiService({
    required Repository repository,
    required SharpApiService sharpApiService,
  })  : _repository = repository,
        _sharpApiService = sharpApiService;

  ///*** quota
  Future<QuotaModel> quota() async {
    final result = await _repository.quota();

    QuotaModel quotaModel = QuotaModel();

    result.fold(
      (error) {
        // log('error2 -> $error');

        throw SharpApiException(error);
      },
      (data) {
        quotaModel = data;
      },
    );

    return quotaModel;
  }

  ///*** ping
  Future<PingModel> ping() async {
    final result = await _repository.ping();

    PingModel pingModel = PingModel();

    result.fold(
          (error) {
        // log('error2 -> $error');

        throw SharpApiException(error);
      },
          (data) {
        pingModel = data;
      },
    );

    return pingModel;
  }
}