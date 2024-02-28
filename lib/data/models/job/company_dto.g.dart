// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyDtoAdapter extends TypeAdapter<CompanyDto> {
  @override
  final int typeId = 6;

  @override
  CompanyDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyDto(
      id: fields[0] as int,
      name: fields[1] as String,
      location: fields[2] as CompanyLocationDto,
      website: fields[3] as String,
      industry: fields[4] as String,
      employeeSize: fields[5] as int,
      headOffice: fields[6] as String,
      description: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyDto obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.website)
      ..writeByte(4)
      ..write(obj.industry)
      ..writeByte(5)
      ..write(obj.employeeSize)
      ..writeByte(6)
      ..write(obj.headOffice)
      ..writeByte(7)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyDto _$CompanyDtoFromJson(Map<String, dynamic> json) => CompanyDto(
      id: json['id'] as int,
      name: json['name'] as String,
      location:
          CompanyLocationDto.fromJson(json['location'] as Map<String, dynamic>),
      website: json['website'] as String,
      industry: json['industry'] as String,
      employeeSize: json['employeeSize'] as int,
      headOffice: json['headOffice'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CompanyDtoToJson(CompanyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location.toJson(),
      'website': instance.website,
      'industry': instance.industry,
      'employeeSize': instance.employeeSize,
      'headOffice': instance.headOffice,
      'description': instance.description,
    };
