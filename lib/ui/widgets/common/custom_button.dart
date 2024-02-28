import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../common/app_colors.dart';
import '../../common/app_enums.dart';
import '../../common/ui_helpers.dart';

class CustomButton extends StatelessWidget {
  final ButtonType variant;

  final String label;

  final bool isBusy;

  final bool isEnabled;

  final VoidCallback? onPressed;

  final Color? backgroundColor;

  final Widget? icon;

  const CustomButton({
    super.key,
    required this.label,
    this.isBusy = false,
    this.isEnabled = true,
    this.onPressed,
    this.variant = ButtonType.primary,
    this.backgroundColor,
    this.icon,
  });

  bool get isPrimary => variant == ButtonType.primary;

  bool get isOutline => variant == ButtonType.outline;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isBusy
          ? CircularProgressIndicator(
              valueColor: const AlwaysStoppedAnimation<Color>(
                Colors.white,
              ),
              strokeWidth: quarterBaseline,
            ).wh(baseline_2x, baseline_2x).centered()
          : [
              if (icon != null) icon!.pOnly(right: baseline_2x),
              label.text.uppercase
                  .size(baseline_2x)
                  .semiBold
                  .color(
                    isEnabled
                        ? (isPrimary
                            ? Colors.white
                            : isOutline
                                ? backgroundColor ?? primaryColor
                                : primaryColor)
                        : Vx.hexToColor('#A5ABB3'),
                  )
                  .make()
                  .centered()
                  .expand()
            ].hStack(
              alignment: MainAxisAlignment.center,
              crossAlignment: CrossAxisAlignment.center,
            ),
    )
        .box
        .border(
          color: isEnabled
              ? (isPrimary
                  ? (backgroundColor ?? primaryColor)
                  : (isOutline
                      ? backgroundColor ?? primaryColor
                      : primaryColor))
              : Colors.white,
          width: isPrimary ? 0 : quarterBaseline,
        )
        .color(
          isEnabled
              ? (isPrimary ? backgroundColor ?? primaryColor : Colors.white)
              : Vx.slate200,
        )
        .withRounded(value: defaultButtonRadius)
        .make()
        .h(baseline_6x)
        .onInkTap(onPressed);
  }
}
