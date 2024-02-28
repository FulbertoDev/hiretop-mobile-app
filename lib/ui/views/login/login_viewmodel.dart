import 'package:hiretop_mobile_app/app/app.locator.dart';
import 'package:hiretop_mobile_app/app/app.router.dart';
import 'package:hiretop_mobile_app/ui/utils/validators.dart';
import 'package:hiretop_mobile_app/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.logger.dart';
import '../../../data/fake/fake_auth.dart';
import '../../../data/models/auth/login_dto.dart';
import '../../../services/user_service.dart';
import '../../utils/setup_snackbar_ui.dart';

class LoginViewModel extends FormViewModel {
  final _logger = getLogger("LoginViewModel");
  final _userService = locator<UserService>();

  void navigateToSignupView() {
    locator<NavigationService>().replaceWithSignupView();
  }

  Future _handleFormSubmission() async {
    var email = emailValue!.trim();
    var password = passwordValue!.trim();

    var payload = LoginDto(email: email, password: password);
    _logger.wtf(payload.toJson());

    //Execute login request
    final value = await runBusyFuture(fakeLogin(payload));

    if (hasError || value == null) {
      locator<SnackbarService>().showCustomSnackBar(
        message: "Identifiants incorrects.",
        variant: SnackbarType.neutral,
      );
      return;
    }

    _logger.w(value.toJson());

    try {
      await _userService.saveUser(value.user, value.token);
      locator<NavigationService>().clearStackAndShow(Routes.homeView);
    } catch (e) {
      _logger.e(e);
    }
  }

  Future submit() async {
    //Validate form fields
    setEmailValidationMessage(emailValidator(emailValue));
    setPasswordValidationMessage(simplePasswordValidator(passwordValue));

    if (!isFormValid) {
      notifyListeners();
      return;
    }

    return _handleFormSubmission();
  }
}
