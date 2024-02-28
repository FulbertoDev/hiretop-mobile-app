// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApplicationStateAdapter extends TypeAdapter<ApplicationState> {
  @override
  final int typeId = 7;

  @override
  ApplicationState read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ApplicationState.pending;
      case 1:
        return ApplicationState.accepted;
      case 2:
        return ApplicationState.rejected;
      default:
        return ApplicationState.pending;
    }
  }

  @override
  void write(BinaryWriter writer, ApplicationState obj) {
    switch (obj) {
      case ApplicationState.pending:
        writer.writeByte(0);
        break;
      case ApplicationState.accepted:
        writer.writeByte(1);
        break;
      case ApplicationState.rejected:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApplicationStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
