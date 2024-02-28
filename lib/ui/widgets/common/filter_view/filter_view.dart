import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:hiretop_mobile_app/data/models/job/job_type.dart';
import 'package:hiretop_mobile_app/ui/common/app_enums.dart';
import 'package:hiretop_mobile_app/ui/common/ui_helpers.dart';
import 'package:hiretop_mobile_app/ui/widgets/common/custom_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../app/app.locator.dart';
import '../../../common/app_colors.dart';
import 'filter_view_model.dart';

class FilterView extends StackedView<FilterViewModel> {
  const FilterView({super.key});

  @override
  Widget builder(
    BuildContext context,
    FilterViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        elevation: 0,
        foregroundColor: primaryColor,
        leading: IconButton(
          onPressed: () {
            locator<NavigationService>().back();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
        title: const Text("Offres"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Filtrer par ancienneté".text.size(baseline_2x).semiBold.make(),
            ...DateFilter.values.map(
              (e) => RadioListTile<DateFilter>(
                contentPadding: EdgeInsets.zero,
                value: e,
                activeColor: orangeColor,
                groupValue: viewModel.dateFilter,
                onChanged: (v) {
                  if (v == null) return;
                  viewModel.setFilter(v);
                },
                title: e.label.text.medium.make(),
              ),
            ),
            Divider(color: Vx.gray300, height: baseline_2x),
            "Filtrer par type de job".text.size(baseline_2x).semiBold.make(),
            ...JobType.values.map(
              (e) => RadioListTile<JobType>(
                contentPadding: EdgeInsets.zero,
                value: e,
                activeColor: orangeColor,
                groupValue: viewModel.jobType,
                onChanged: (v) {
                  if (v == null) return;
                  viewModel.setJobType(v);
                },
                title: e.label.text.medium.make(),
              ),
            ),
            Divider(color: Vx.gray300, height: baseline_2x),
            "Filtrer par tranche de rémunération"
                .text
                .size(baseline_2x)
                .semiBold
                .make(),
            baseline_2x.heightBox,
            FlutterSlider(
              values: [viewModel.minSalary, viewModel.maxSalary],
              rangeSlider: true,
              max: 100000,
              min: 0,
              tooltip: FlutterSliderTooltip(
                  leftPrefix: const Icon(
                    Icons.attach_money,
                    size: 19,
                    color: Colors.black45,
                  ),
                  rightSuffix: const Icon(
                    Icons.attach_money,
                    size: 19,
                    color: Colors.black45,
                  ),
                  custom: (value) {
                    return "${(value as double).toInt()} K"
                        .text
                        .semiBold
                        .black
                        .make();
                  }),
              trackBar: FlutterSliderTrackBar(
                inactiveTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black12,
                ),
                activeTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: orangeColor,
                ),
              ),
              onDragging: (handlerIndex, lowerValue, upperValue) {
                viewModel.setSalaryRange(RangeValues(lowerValue, upperValue));
              },
            ),
            [
              "${(viewModel.minSalary).toInt()} K".text.semiBold.black.make(),
              "${(viewModel.maxSalary).toInt()} K".text.semiBold.black.make(),
            ].hStack(alignment: MainAxisAlignment.spaceBetween).px24(),
            baseline_3x.heightBox,
            CustomButton(
              label: "Appliquer",
              onPressed: () {},
            ),
          ],
        ).px16(),
      ),
    );
  }

  @override
  FilterViewModel viewModelBuilder(BuildContext context) => FilterViewModel();
}
