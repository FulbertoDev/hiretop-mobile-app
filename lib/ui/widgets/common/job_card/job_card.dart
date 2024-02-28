import 'package:flutter/material.dart';
import 'package:hiretop_mobile_app/app/app.router.dart';
import 'package:hiretop_mobile_app/data/models/job/job_dto.dart';
import 'package:hiretop_mobile_app/ui/common/app_colors.dart';
import 'package:hiretop_mobile_app/ui/common/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../app/app.locator.dart';

class JobCard extends StatelessWidget {
  final JobDto job;
  final bool isFavorite;
  final Function() onFav;
  const JobCard({
    super.key,
    required this.job,
    required this.isFavorite,
    required this.onFav,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(baseline_2x),
        ),
        child: [
          [
            [
              job.jobPosition.text
                  .size(baseline_5)
                  .color(primaryColor)
                  .bold
                  .make(),
              job.company.name.richText
                  .withTextSpanChildren([
                    " • ".textSpan.bold.size(baseline_2x).make(),
                    job.company.location.completeLocation.textSpan.make(),
                  ])
                  .size(baseline_5)
                  .normal
                  .color(Vx.hexToColor("#524B6B"))
                  .make(),
            ].vStack(crossAlignment: CrossAxisAlignment.start).expand(),
            IconButton(
              onPressed: onFav,
              icon: Icon(
                isFavorite
                    ? Icons.bookmark_rounded
                    : Icons.bookmark_outline_rounded,
              ),
            ),
          ].hStack(),
          [
            "\$${job.monthlySalary}"
                .richText
                .color(primaryColor)
                .semiBold
                .withTextSpanChildren([
              "/Mo".textSpan.hexColor("#AAA6B9").make(),
            ]).make(),
            job.jobType.label.text.semiBold
                .size(baseline)
                .hexColor("#524B6B")
                .make()
                .px8()
                .py4()
                .box
                .withRounded(value: baseline)
                .hexColor("#f3f2f5")
                .make(),
          ].hStack(alignment: MainAxisAlignment.spaceBetween),
        ]
            .vStack(
                crossAlignment: CrossAxisAlignment.start,
                alignment: MainAxisAlignment.spaceBetween)
            .p16(),
      ),
    ).onTap(() {
      locator<NavigationService>().navigateToJobDetailsView(job: job);
    }).px16();
  }
}
