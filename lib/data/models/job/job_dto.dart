import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'company_dto.dart';
import 'job_type.dart';

part 'job_dto.g.dart';

@HiveType(typeId: 4)
@JsonSerializable(explicitToJson: true)
class JobDto extends HiveObject {
  @HiveField(0)
  @JsonKey(name: 'object_id')
  final int id;

  @HiveField(1)
  final String jobPosition;

  @HiveField(2)
  JobType jobType;

  @HiveField(3)
  DateTime publishedAt;

  @HiveField(4)
  String description;

  @HiveField(5)
  List<String> requirements;

  @HiveField(6)
  int monthlySalary;

  @HiveField(8)
  CompanyDto company;

  JobDto({
    required this.id,
    required this.jobPosition,
    required this.jobType,
    required this.company,
    required this.publishedAt,
    required this.description,
    required this.requirements,
    required this.monthlySalary,
  });
  factory JobDto.fromJson(Map<String, dynamic> data) => _$JobDtoFromJson(data);

  Map<String, dynamic> toJson() => _$JobDtoToJson(this);
}
