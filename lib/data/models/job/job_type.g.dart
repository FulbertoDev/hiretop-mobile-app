// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobTypeAdapter extends TypeAdapter<JobType> {
  @override
  final int typeId = 3;

  @override
  JobType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return JobType.remote;
      case 1:
        return JobType.fullTime;
      case 2:
        return JobType.partTime;
      default:
        return JobType.remote;
    }
  }

  @override
  void write(BinaryWriter writer, JobType obj) {
    switch (obj) {
      case JobType.remote:
        writer.writeByte(0);
        break;
      case JobType.fullTime:
        writer.writeByte(1);
        break;
      case JobType.partTime:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
