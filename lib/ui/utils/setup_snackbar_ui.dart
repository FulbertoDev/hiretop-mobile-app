import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../app/app.locator.dart';
import '../common/ui_helpers.dart';

enum SnackbarType { neutral }

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  SnackbarConfig buildSnackbarConfig({required Color backgroundColor}) =>
      SnackbarConfig(
        backgroundColor: backgroundColor,
        messageColor: Colors.white,
        borderRadius: defaultButtonRadius,
        shouldIconPulse: false,
        margin: EdgeInsets.only(
          left: baseline_5,
          right: baseline_5,
          bottom: baseline_2x,
        ),
        dismissDirection: DismissDirection.horizontal,
      );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.neutral,
    config: buildSnackbarConfig(
      backgroundColor: Vx.hexToColor("#3F4854"),
    ),
  );
}
