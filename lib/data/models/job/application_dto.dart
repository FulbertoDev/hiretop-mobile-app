import 'package:hiretop_mobile_app/data/models/job/job_dto.dart';
import 'package:hiretop_mobile_app/data/models/user/user_dto.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'application_state.dart';

part 'application_dto.g.dart';

@HiveType(typeId: 8)
@JsonSerializable(explicitToJson: true)
class ApplicationDto extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final JobDto job;

  @HiveField(2)
  final UserDto candidate;

  @HiveField(3)
  final DateTime applicationDate;

  @HiveField(4)
  final ApplicationState status;

  ApplicationDto({
    required this.id,
    required this.job,
    required this.candidate,
    this.status = ApplicationState.pending,
    required this.applicationDate,
  });
  factory ApplicationDto.fromJson(Map<String, dynamic> data) =>
      _$ApplicationDtoFromJson(data);

  Map<String, dynamic> toJson() => _$ApplicationDtoToJson(this);
}
