// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApplicationDtoAdapter extends TypeAdapter<ApplicationDto> {
  @override
  final int typeId = 8;

  @override
  ApplicationDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ApplicationDto(
      id: fields[0] as int,
      job: fields[1] as JobDto,
      candidate: fields[2] as UserDto,
      status: fields[4] as ApplicationState,
      applicationDate: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ApplicationDto obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.job)
      ..writeByte(2)
      ..write(obj.candidate)
      ..writeByte(3)
      ..write(obj.applicationDate)
      ..writeByte(4)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApplicationDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationDto _$ApplicationDtoFromJson(Map<String, dynamic> json) =>
    ApplicationDto(
      id: json['id'] as int,
      job: JobDto.fromJson(json['job'] as Map<String, dynamic>),
      candidate: UserDto.fromJson(json['candidate'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$ApplicationStateEnumMap, json['status']) ??
          ApplicationState.pending,
      applicationDate: DateTime.parse(json['applicationDate'] as String),
    );

Map<String, dynamic> _$ApplicationDtoToJson(ApplicationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'job': instance.job.toJson(),
      'candidate': instance.candidate.toJson(),
      'applicationDate': instance.applicationDate.toIso8601String(),
      'status': _$ApplicationStateEnumMap[instance.status]!,
    };

const _$ApplicationStateEnumMap = {
  ApplicationState.pending: 'pending',
  ApplicationState.accepted: 'accepted',
  ApplicationState.rejected: 'rejected',
};
