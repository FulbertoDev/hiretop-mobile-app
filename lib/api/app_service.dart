// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../data/models/auth/login_dto.dart';

part 'app_service.g.dart';

const baseUrl = 'http://192.168.1.100:8081/api';

@RestApi(baseUrl: baseUrl)
abstract class AppService {
  factory AppService(Dio dio, {String baseUrl}) = _AppService;

  @POST('/auth/login')
  Future<LoginResponseDto> login(@Body() LoginDto payload);
}
