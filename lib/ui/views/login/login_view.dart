import 'package:flutter/material.dart';
import 'package:hiretop_mobile_app/gen/assets.gen.dart';
import 'package:hiretop_mobile_app/ui/common/app_colors.dart';
import 'package:hiretop_mobile_app/ui/common/app_enums.dart';
import 'package:hiretop_mobile_app/ui/common/ui_helpers.dart';
import 'package:hiretop_mobile_app/ui/views/login/login_view.form.dart';
import 'package:hiretop_mobile_app/ui/widgets/common/custom_button.dart';
import 'package:hiretop_mobile_app/ui/widgets/common/custom_input.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:velocity_x/velocity_x.dart';

import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: [
        Assets.svg.logo.svg(),
        "Bon retour".text.size(baseline_3x).bold.makeCentered().p16(),
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"
            .text
            .size(baseline_5_5)
            .normal
            .center
            .makeCentered(),
        baseline_8x.heightBox,
        CustomInput(
          label: "Email",
          errorMessage: viewModel.emailValidationMessage,
          controller: emailController,
          focusNode: emailFocusNode,
        ),
        baseline_3x.heightBox,
        CustomInput(
          label: "Mot de passe",
          inputType: InputType.password,
          errorMessage: viewModel.passwordValidationMessage,
          controller: passwordController,
          focusNode: passwordFocusNode,
        ),
        baseline_3x.heightBox,
        "Forgot Password ?".text.semiBold.underline.make().objectCenterRight(),
        baseline_3x.heightBox,
        CustomButton(
          label: "Se connecter",
          onPressed: viewModel.submit,
          isBusy: viewModel.isBusy,
        ),
        baseline_2x.heightBox,
        RichText(
          text: const TextSpan(
            text: "You don't have an account yet?  ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
            children: [
              TextSpan(
                text: "Sign up",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: orangeColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ).p8().onInkTap(viewModel.navigateToSignupView),
      ]
          .vStack(crossAlignment: CrossAxisAlignment.center)
          .px32()
          .scrollVertical()
          .safeArea(),
    );
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    emailController.text = "freida.morar@reinger.info";
    passwordController.text = "freida.morar";
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
