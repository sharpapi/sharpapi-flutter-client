import 'dart:async';

import 'package:dio/dio.dart';
import 'package:sharpapi_flutter_client/src/core/error/exceptions.dart';
import 'package:sharpapi_flutter_client/src/core/network/remote/api_endpoints.dart';

abstract class DioHelper {
  Future<dynamic> post({
    String? base,
    required String url,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    Duration? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> get({
    String? base,
    required String url,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    Duration? timeOut,
    bool isMultipart = false,
  });
}

class DioImpl extends DioHelper {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: '$baseUrl$apiVersion',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
    ),
  );

  @override
  Future post({
    String? base,
    required String url,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    Duration? timeOut,
    bool isMultipart = false,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    if (base != null) {
      dio.options.baseUrl = base;
    } else {
      dio.options.baseUrl = '$baseUrl$apiVersion';
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      'User-Agent': 'SharpAPIDartAgent/1.2.0',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null)
        'Authorization': 'Bearer $token'
    };

    if (url.contains('??')) {
      url = url.replaceAll('??', '?');
    }

    // log('URL => ${dio.options.baseUrl + url}');
    // log('Header => ${dio.options.headers.toString()}');
    // log('Body => $data');
    // log('Query => $query');

    return await request(
      () async => await dio.post(
        url,
        data: data,
        queryParameters: query,
        onSendProgress: progressCallback,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  Future get({
    String? base,
    required String url,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    Duration? timeOut,
    bool isMultipart = false,
  }) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    if (base != null) {
      dio.options.baseUrl = base;
    } else {
      dio.options.baseUrl = '$baseUrl$apiVersion';
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      'User-Agent': 'SharpAPIDartAgent/1.2.0',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null)
        'Authorization': 'Bearer $token'
    };

    if (url.contains('??')) {
      url = url.replaceAll('??', '?');
    }

    // log('URL => ${dio.options.baseUrl + url}');
    // log('Header => ${dio.options.headers.toString()}');
    // log('Body => $data');
    // log('Query => $query');

    return await request(
      () async => await dio.get(
        url,
        queryParameters: query,
        cancelToken: cancelToken,
      ),
    );
  }
}

extension on DioHelper {
  Future request(Future<Response> Function() request) async {
    try {
      final r = await request.call();
      return r;
    } on DioException catch (e) {
      // log("Error Message => ${e.message}");
      // log("Error => ${e.error.toString()}");
      // log("Error => ${e.type.name.toString()}");

      if (e.response != null) {
        // log("Error Response => ${e.response}");
        // log("Error Response Message => ${e.response!.statusMessage}");
        // log("Error Response Status Code => ${e.response!.statusCode}");
        // log("Error Response Data => ${e.response!.data}");
        // log("Error Response Data Message => ${e.response!.data['message']}");

        throw ServerException(
          code: e.response!.statusCode!,
          message: e.response!.data['message'],
        );
      } else {
        throw ServerException(
          code: 500,
          message: e.message!,
        );
      }
    } catch (e) {
      throw Exception();
    }
  }
}