import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import '../app/app.logger.dart';
import '../data/models/job/application_dto.dart';
import '../data/models/user/user_dto.dart';
import '../ui/utils/db_utils.dart';

class UserService with ListenableServiceMixin {
  final logger = getLogger("UserService");

  final ReactiveValue<UserDto?> _user = ReactiveValue(
      Hive.box(DbUtils.authBox).get(DbUtils.currentUser, defaultValue: null));

  final ReactiveValue<List<ApplicationDto>> _applications = ReactiveValue([]);
  List<ApplicationDto> get applications => _applications.value;

  UserDto? get user => _user.value;

  UserService() {
    listenToReactiveValues([_user, _applications]);
    initWatcher();
    loadUserApplication();
  }

  void initWatcher() {
    Hive.box(DbUtils.authBox).watch(key: DbUtils.currentUser).listen((event) {
      logger.wtf("Event: ${event.value}");
      if (event.value != null) {
        final user = event.value as UserDto;
        _user.value = user;
      } else {
        _user.value = null;
      }
    });
    Hive.box<ApplicationDto>(DbUtils.applicationBox).watch().listen((event) {
      loadUserApplication();
    });
  }

  void loadUserApplication() {
    final data =
        Hive.box<ApplicationDto>(DbUtils.applicationBox).values.toList();
    _applications.value = data
        .filter((element) => element.candidate.id == (user?.id ?? 0))
        .toList();
  }

  Future saveUser(UserDto user, String token) async {
    await Hive.box(DbUtils.authBox).put(DbUtils.token, token);
    await Hive.box(DbUtils.authBox).put(DbUtils.currentUser, user);
    return;
  }

  Future clearData() {
    return Hive.box(DbUtils.authBox).clear();
  }
}
