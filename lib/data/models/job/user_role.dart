import 'package:hive/hive.dart';

part 'user_role.g.dart';

@HiveType(typeId: 2)
enum UserRole {
  @HiveField(0)
  enterprise(label: 'Entreprise'),

  @HiveField(1)
  candidate(label: 'Candidat');

  final String label;
  const UserRole({required this.label});
}
