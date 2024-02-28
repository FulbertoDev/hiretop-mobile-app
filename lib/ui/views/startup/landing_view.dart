import 'package:flutter/material.dart';
import 'package:hiretop_mobile_app/app/app.locator.dart';
import 'package:hiretop_mobile_app/app/app.router.dart';
import 'package:hiretop_mobile_app/gen/assets.gen.dart';
import 'package:hiretop_mobile_app/ui/common/app_colors.dart';
import 'package:hiretop_mobile_app/ui/common/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          locator<NavigationService>().replaceWithLoginView();
        },
        child: const Icon(Icons.arrow_forward_rounded),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Assets.svg.landingIllustration.svg().centered(),
          baseline_10x.heightBox,
          RichText(
            text: TextSpan(
              text: "Find Your\n",
              style: TextStyle(
                fontSize: baseline_5x,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: "Dream Job\n",
                  style: TextStyle(
                    fontSize: baseline_5x,
                    color: orangeColor,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "Her !",
                  style: TextStyle(
                    fontSize: baseline_5x,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ).px32(),
          baseline_3x.heightBox,
          "Explore all the most exciting job roles based\non your interest and study major."
              .text
              .hexColor("#524B6B")
              .size(14)
              .make()
              .px32(),
        ],
      ).safeArea(),
    );
  }
}
