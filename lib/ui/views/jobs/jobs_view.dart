import 'package:flutter/material.dart';
import 'package:hiretop_mobile_app/ui/common/app_colors.dart';
import 'package:hiretop_mobile_app/ui/common/ui_helpers.dart';
import 'package:hiretop_mobile_app/ui/widgets/common/job_card/job_card.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../app/app.locator.dart';
import 'jobs_viewmodel.dart';

class JobsView extends StackedView<JobsViewModel> {
  const JobsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    JobsViewModel viewModel,
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
        actions: [
          IconButton(
            onPressed: viewModel.setFilter,
            icon: const Icon(
              Icons.tune_rounded,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (ctx, index) {
          var job = viewModel.jobs[index];
          bool isFav = viewModel.favs.contains(viewModel.jobs[index].id);
          return JobCard(
            job: job,
            isFavorite: isFav,
            onFav: () {
              if (!isFav) {
                viewModel.addToFavorite(job);
              } else {
                viewModel.removeFromFavorite(job.id);
              }
            },
          );
        },
        separatorBuilder: (ctx, index) => baseline_2x.heightBox,
        itemCount: viewModel.jobs.length,
      ),
    );
  }

  @override
  JobsViewModel viewModelBuilder(BuildContext context) => JobsViewModel();
}
