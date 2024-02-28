import 'package:flutter/material.dart';
import 'package:hiretop_mobile_app/app/app.locator.dart';
import 'package:hiretop_mobile_app/app/app.router.dart';
import 'package:hiretop_mobile_app/gen/assets.gen.dart';
import 'package:hiretop_mobile_app/ui/common/app_colors.dart';
import 'package:hiretop_mobile_app/ui/common/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  List<BottomNavigationBarItem> get items => <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Assets.svg.homeIcon.svg(),
          label: Routes.homeView,
        ),
        BottomNavigationBarItem(
          icon: Assets.svg.connectionIcon.svg(),
          label: Routes.applicationsView,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.description_rounded,
            size: baseline_2x_5,
            color: Colors.white,
          ).p8().box.color(primaryColor).roundedFull.make(),
          label: Routes.jobsView,
        ),
        BottomNavigationBarItem(
          icon: Assets.svg.chatIcon.svg(),
          label: Routes.chatsView,
        ),
        BottomNavigationBarItem(
          icon: Assets.svg.favIcon.svg(),
          label: Routes.favoritesView,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return [
      ...items.map((e) => e.icon.centered().onInkTap(() {
            locator<NavigationService>().navigateTo(e.label!);
          }).expand()),
    ]
        .hStack()
        .h(baseline_8x)
        .safeArea()
        .box
        .white
        .topRounded(value: baseline_2x)
        .make();
  }
}
