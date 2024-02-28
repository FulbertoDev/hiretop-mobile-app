import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../common/app_colors.dart';
import '../../common/app_enums.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_input.dart';
import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: [
        "Créer un compte".text.size(baseline_3x).bold.makeCentered().p16(),
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"
            .text
            .size(baseline_5_5)
            .normal
            .center
            .makeCentered(),
        baseline_8x.heightBox,
        const CustomInput(
          label: "Nom & Prénom(s)",
        ),
        baseline_2x.heightBox,
        const CustomInput(
          label: "Email",
        ),
        baseline_2x.heightBox,
        const CustomInput(
          label: "Mot de passe",
          inputType: InputType.password,
        ),
        baseline_3x.heightBox,
        const CustomButton(
          label: "S'inscrire",
        ),
        baseline_2x.heightBox,
        RichText(
          text: const TextSpan(
            text: "Already have an account ?  ",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
            children: [
              TextSpan(
                text: "Sign in",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: orangeColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ).p8().onInkTap(viewModel.navigateToLoginView),
      ]
          .vStack(crossAlignment: CrossAxisAlignment.center)
          .px32()
          .scrollVertical()
          .safeArea(),
    );
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
