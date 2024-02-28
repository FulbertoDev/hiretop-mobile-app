import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../ui/utils/interceptors/request.dart';
import '../ui/utils/interceptors/request_logging.dart';
import 'app_service.dart';

class ApiClient {
  static final ApiClient _apiClient = ApiClient._internal();

  AppService? _api;

  Dio? _dio;

  factory ApiClient() => _apiClient;

  ApiClient._internal() {
    _dio ??= Dio(BaseOptions(headers: {}));

    // Setup interceptors
    _dio?.interceptors.addAll(
      [
        RequestInterceptor(),
      ],
    );

    if (kDebugMode) {
      // Add custom logging interceptor for requests logging on debug mmode
      _dio?.interceptors.add(
        RequestLoggingInterceptors(),
      );
    }

    _api ??= AppService(_dio!);
  }

  AppService appService() => _api!;
}
