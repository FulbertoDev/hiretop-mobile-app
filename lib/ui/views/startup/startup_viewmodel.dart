import 'package:hiretop_mobile_app/app/app.logger.dart';
import 'package:hiretop_mobile_app/ui/utils/db_utils.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final _logger = getLogger("StartupViewModel");

  final authBox = Hive.box(DbUtils.authBox);

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));

    final isAuthenticated = authBox.containsKey(DbUtils.currentUser) &&
        authBox.containsKey(DbUtils.token);
    _logger.wtf("isAuthenticated: $isAuthenticated");
    if (isAuthenticated) {
      _navigationService.replaceWithHomeView();
      return;
    }
    _navigationService.replaceWithLandingView();
  }
}
