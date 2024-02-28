import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class RequestLoggingInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      var method = options.method.toUpperCase();
      var reqUrl = '${options.baseUrl}${options.path}';

      print('# REQUEST:');
      print('--> $method $reqUrl');

      var headers = options.headers;
      if (headers.isNotEmpty) {
        print('Headers:');

        // ignore: avoid_print
        void printHeader(String k, dynamic v) => print('$k: $v');
        headers.forEach(printHeader);
      }

      print('DATA: ${jsonEncode(options.data)}');

      print('--> END $method');
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      var options = response.requestOptions;
      var method = options.method.toUpperCase();
      var reqUrl = '${options.baseUrl}${options.path}';

      var statusCode = response.statusCode;
      var statusMessage = response.statusMessage;

      print('# RESPONSE:');

      print('<-- $statusCode $method $reqUrl');

      print('ResponseData: ${jsonEncode(response.data)}');
      print('ResponseMessage: $statusMessage');

      print('--> END RESPONSE');
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('# ERROR');

      var options = err.requestOptions;
      var method = options.method;
      var reqUrl = '${options.baseUrl}${options.path}';
      var statusCode = err.response?.statusCode;
      var statusMessage = err.response?.statusMessage;

      print('<-- $statusCode $method $reqUrl');

      print('CODE: $statusCode');
      print('MESSAGE: $statusMessage');
      print('DATA: ${jsonEncode(err.response?.data)}');

      print('--> END $method');
    }

    super.onError(err, handler);
  }
}
