import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_location_dto.g.dart';

@HiveType(typeId: 5)
@JsonSerializable(explicitToJson: true)
class CompanyLocationDto extends HiveObject {
  @HiveField(0)
  final String city;

  @HiveField(1)
  String country;

  CompanyLocationDto({
    required this.city,
    required this.country,
  });

  String get completeLocation => "$city, $country";
  factory CompanyLocationDto.fromJson(Map<String, dynamic> data) =>
      _$CompanyLocationDtoFromJson(data);

  Map<String, dynamic> toJson() => _$CompanyLocationDtoToJson(this);
}
