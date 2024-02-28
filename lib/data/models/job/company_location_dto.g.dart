// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_location_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyLocationDtoAdapter extends TypeAdapter<CompanyLocationDto> {
  @override
  final int typeId = 5;

  @override
  CompanyLocationDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyLocationDto(
      city: fields[0] as String,
      country: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyLocationDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.city)
      ..writeByte(1)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyLocationDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyLocationDto _$CompanyLocationDtoFromJson(Map<String, dynamic> json) =>
    CompanyLocationDto(
      city: json['city'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$CompanyLocationDtoToJson(CompanyLocationDto instance) =>
    <String, dynamic>{
      'city': instance.city,
      'country': instance.country,
    };
