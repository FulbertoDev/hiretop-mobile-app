// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobDtoAdapter extends TypeAdapter<JobDto> {
  @override
  final int typeId = 4;

  @override
  JobDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JobDto(
      id: fields[0] as int,
      jobPosition: fields[1] as String,
      jobType: fields[2] as JobType,
      company: fields[8] as CompanyDto,
      publishedAt: fields[3] as DateTime,
      description: fields[4] as String,
      requirements: (fields[5] as List).cast<String>(),
      monthlySalary: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, JobDto obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.jobPosition)
      ..writeByte(2)
      ..write(obj.jobType)
      ..writeByte(3)
      ..write(obj.publishedAt)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.requirements)
      ..writeByte(6)
      ..write(obj.monthlySalary)
      ..writeByte(8)
      ..write(obj.company);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobDto _$JobDtoFromJson(Map<String, dynamic> json) => JobDto(
      id: json['object_id'] as int,
      jobPosition: json['jobPosition'] as String,
      jobType: $enumDecode(_$JobTypeEnumMap, json['jobType']),
      company: CompanyDto.fromJson(json['company'] as Map<String, dynamic>),
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      description: json['description'] as String,
      requirements: (json['requirements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      monthlySalary: json['monthlySalary'] as int,
    );

Map<String, dynamic> _$JobDtoToJson(JobDto instance) => <String, dynamic>{
      'object_id': instance.id,
      'jobPosition': instance.jobPosition,
      'jobType': _$JobTypeEnumMap[instance.jobType]!,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'description': instance.description,
      'requirements': instance.requirements,
      'monthlySalary': instance.monthlySalary,
      'company': instance.company.toJson(),
    };

const _$JobTypeEnumMap = {
  JobType.remote: 'remote',
  JobType.fullTime: 'fullTime',
  JobType.partTime: 'partTime',
};
