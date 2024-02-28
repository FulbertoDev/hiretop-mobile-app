import 'package:hive/hive.dart';

part 'job_type.g.dart';

@HiveType(typeId: 3)
enum JobType {
  @HiveField(0)
  remote(label: 'Remote'),

  @HiveField(1)
  fullTime(label: 'Full Time'),

  @HiveField(2)
  partTime(label: 'Part Time');

  final String label;
  const JobType({required this.label});
}
