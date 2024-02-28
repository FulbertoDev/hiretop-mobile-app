import 'package:hiretop_mobile_app/data/models/job/company_dto.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_role.dart';

part 'user_dto.g.dart';

@HiveType(typeId: 1)
@JsonSerializable(explicitToJson: true)
class UserDto extends HiveObject {
  @HiveField(0)
  @JsonKey(name: 'object_id')
  final int id;

  @HiveField(1)
  final String firstname;

  @HiveField(2)
  final String lastname;

  @HiveField(3)
  final String email;

  @HiveField(4)
  final String phone;

  @HiveField(5)
  final UserRole role;

  @HiveField(6)
  final CompanyDto? company;

  UserDto(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.phone,
      this.role = UserRole.candidate,
      this.company})
      : assert(role == UserRole.enterprise ? company != null : company == null);

  UserDto copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? email,
    String? phone,
  }) {
    return UserDto(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role,
    );
  }

  String get fullname => '$lastname $firstname';

  factory UserDto.fromJson(Map<String, dynamic> data) =>
      _$UserDtoFromJson(data);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
