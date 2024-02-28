import 'package:hiretop_mobile_app/data/models/user/user_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_dto.g.dart';

@JsonSerializable()
class LoginDto {
  final String email;

  final String password;

  LoginDto({required this.email, required this.password});

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);
}

@JsonSerializable()
class LoginResponseDto {
  final String token;

  final UserDto user;

  LoginResponseDto({
    required this.token,
    required this.user,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);
}
