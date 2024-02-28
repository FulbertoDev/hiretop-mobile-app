import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hiretop_mobile_app/ui/common/app_colors.dart';
import 'package:hiretop_mobile_app/ui/common/app_enums.dart';
import 'package:hiretop_mobile_app/ui/common/ui_helpers.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../gen/assets.gen.dart';

class CustomInput extends HookWidget {
  final String? label, errorMessage;
  final InputType inputType;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  const CustomInput({
    super.key,
    this.label,
    this.errorMessage,
    this.inputType = InputType.text,
    this.onChanged,
    this.controller,
    this.focusNode,
  });

  bool get hasError => errorMessage != null;
  bool get isPasswordInput => inputType == InputType.password;

  @override
  Widget build(BuildContext context) {
    final showPassword = useState(false);

    const inputBorder = InputBorder.none;
    return [
      if (label != null)
        label!.text
            .color(primaryColor)
            .bold
            .size(baseline_5_5)
            .make()
            .pOnly(bottom: baseline_5),
      Container(
        padding:
            EdgeInsets.symmetric(horizontal: baseline_5, vertical: baseline),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(baseline_5),
          border:
              Border.all(color: hasError ? Vx.red500 : Vx.white, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.2),
              blurRadius: 10,
              offset: const Offset(1, 5),
              spreadRadius: 0.1,
              blurStyle: BlurStyle.normal,
            ),
          ],
        ),
        child: Row(
          children: [
            TextField(
              style: TextStyle(
                color: primaryColorDark.withOpacity(.6),
                fontWeight: FontWeight.w600,
              ),
              decoration: const InputDecoration(
                border: inputBorder,
                focusedBorder: inputBorder,
                focusedErrorBorder: inputBorder,
                errorBorder: inputBorder,
                enabledBorder: inputBorder,
              ),
              obscuringCharacter: "•",
              obscureText: !isPasswordInput ? false : !showPassword.value,
              onChanged: onChanged,
              controller: controller,
              focusNode: focusNode,
            ).expand(),
            if (inputType == InputType.password)
              (showPassword.value
                      ? Assets.svg.eyeSlashIcon
                      : Assets.svg.eyeIcon)
                  .svg()
                  .onInkTap(() {
                showPassword.value = !showPassword.value;
              })
          ],
        ),
      ),
      if (hasError)
        [
          Icon(
            Icons.info_outline_rounded,
            color: Vx.red500,
            size: baseline_2x,
          ),
          semiBaseline.widthBox,
          errorMessage!.text.semiBold.size(baseline_2x).color(Vx.red500).make(),
        ].hStack().p8(),
    ]
        .vStack(
          crossAlignment: CrossAxisAlignment.start,
          axisSize: MainAxisSize.min,
        )
        .py4();
  }
}
