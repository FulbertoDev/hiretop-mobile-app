import 'package:hiretop_mobile_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class SignupViewModel extends BaseViewModel {
  void navigateToLoginView() {
    locator<NavigationService>().replaceWithLoginView();
  }
}
