import 'package:hive_flutter/hive_flutter.dart';

part 'application_state.g.dart';

@HiveType(typeId: 7)
enum ApplicationState {
  @HiveField(0)
  pending,
  @HiveField(1)
  accepted,
  @HiveField(2)
  rejected;
}
