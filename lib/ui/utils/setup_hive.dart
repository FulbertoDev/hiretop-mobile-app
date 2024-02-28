import 'package:flutter/foundation.dart';
import 'package:hiretop_mobile_app/data/models/job/application_dto.dart';
import 'package:hiretop_mobile_app/data/models/job/company_dto.dart';
import 'package:hiretop_mobile_app/data/models/job/company_location_dto.dart';
import 'package:hiretop_mobile_app/data/models/job/job_dto.dart';
import 'package:hiretop_mobile_app/data/models/user/user_role.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path;

import '../../data/models/job/application_state.dart';
import '../../data/models/job/job_type.dart';
import '../../data/models/user/user_dto.dart';
import 'db_utils.dart';

Future<void> _openBoxes() async {
  await Hive.openBox(DbUtils.authBox);
  await Hive.openBox<JobDto>(DbUtils.favoriteBox);
  await Hive.openBox<ApplicationDto>(DbUtils.applicationBox);
}

Future setupHive() async {
  Hive.registerAdapter(UserRoleAdapter());
  Hive.registerAdapter(UserDtoAdapter());
  Hive.registerAdapter(JobTypeAdapter());
  Hive.registerAdapter(JobDtoAdapter());
  Hive.registerAdapter(CompanyDtoAdapter());
  Hive.registerAdapter(CompanyLocationDtoAdapter());
  Hive.registerAdapter(ApplicationDtoAdapter());
  Hive.registerAdapter(ApplicationStateAdapter());

  if (kIsWeb) {
    await Hive.initFlutter();
  } else {
    var docsDir = await path.getApplicationDocumentsDirectory();
    var docsPath = docsDir.path;
    await Hive.initFlutter(docsPath);
  }

  await _openBoxes();
}
