import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:user_test/core/core.dart';
import 'package:user_test/core/network/base_url.dart';
import 'package:user_test/core/network/network_info.dart';
import 'package:user_test/presentation/utils/utils.dart' as Utils;

enum HTTP { GET, POST }

class Api {
  final Dio dio;
  final NetworkInfo networkInfo;

  Api({required this.dio, required this.networkInfo});

  Future<Either<Failure, Response>> call(
    HTTP http,
    String url, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    bool requireToken = false,
  }) async {
    if (kIsWeb) {
      return callApi(
        http,
        url,
        body: body,
        queryParameters: queryParameters,
        requireToken: requireToken,
      );
    } else {
      if (await networkInfo.hasConnection()) {
        return callApi(
          http,
          url,
          body: body,
          queryParameters: queryParameters,
          requireToken: requireToken,
        );
      } else {
        return Left(Failure(message: 'No Internet'));
      }
    }
  }

  Future<Either<Failure, Response>> callApi(
    HTTP http,
    String url, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    bool requireToken = false,
  }) async {
    if (http == HTTP.GET) {
      try {
        Response response = await dio.get(BaseUrl.getBaseUrl() + url,
            queryParameters: queryParameters,
            options: Options(headers: await getHeader(requireToken)));

        return Right(response);
      } on DioError catch (e) {
        return Left(_error(e));
      }
    } else {
      try {
        final response = await dio.post(BaseUrl.getBaseUrl() + url,
            data: body,
            options: Options(headers: await getHeader(requireToken)));
        return Right(response);
      } on DioError catch (e) {
        return Left(_error(e));
      }
    }
  }

  Failure _error(DioError e) {
    if (e.type == DioErrorType.connectTimeout) {
      Utils.toast('Connection Timeout');
      return Failure(message: 'Connection Timeout');
    } else {
      print(e.response?.data);
      return Failure(message: e.response?.data);
    }
  }

  Future<Map<String, String>> getHeader(bool requireToken) async {
    if (requireToken == true) {
      return {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: 'Bearer ' + 'token'
      };
    } else {
      return {
        HttpHeaders.contentTypeHeader: "application/json",
      };
    }
  }
}
