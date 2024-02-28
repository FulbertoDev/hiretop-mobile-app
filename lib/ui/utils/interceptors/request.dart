import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../../app/app.logger.dart';
import '../constants/strings.dart';
import '../db_utils.dart';

class RequestInterceptor extends Interceptor {
  final logger = getLogger("RequestInterceptor");

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var token = Hive.box(DbUtils.authBox).get(DbUtils.token);
    options.headers = {
      "Authorization": "Bearer $token",
      "x-app-key": AppStrings.xAppKey,
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
