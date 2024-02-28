import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'company_location_dto.dart';
part 'company_dto.g.dart';

@HiveType(typeId: 6)
@JsonSerializable(explicitToJson: true)
class CompanyDto extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  CompanyLocationDto location;

  @HiveField(3)
  final String website;

  @HiveField(4)
  final String industry;

  @HiveField(5)
  final int employeeSize;

  @HiveField(6)
  final String headOffice;

  @HiveField(7)
  final String description;

  CompanyDto({
    required this.id,
    required this.name,
    required this.location,
    required this.website,
    required this.industry,
    required this.employeeSize,
    required this.headOffice,
    required this.description,
  });
  factory CompanyDto.fromJson(Map<String, dynamic> data) =>
      _$CompanyDtoFromJson(data);

  Map<String, dynamic> toJson() => _$CompanyDtoToJson(this);
}
