import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hiretop_mobile_app/data/models/user/user_role.dart';
import 'package:hiretop_mobile_app/gen/assets.gen.dart';
import 'package:hiretop_mobile_app/ui/common/app_colors.dart';
import 'package:hiretop_mobile_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/common/bottom_bar/bottom_bar.dart';
import '../../widgets/common/job_card/job_card.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        elevation: 0,
        flexibleSpace: const _HomeAppBar(),
        toolbarHeight: baseline_10x,
      ),
      body: switch (viewModel.role) {
        UserRole.candidate => const CandidateHomeView(),
        UserRole.enterprise => const EntrepriseHomeView(),
      },
      bottomNavigationBar: const BottomBar(),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}

class _HomeAppBar extends ViewModelWidget<HomeViewModel> {
  const _HomeAppBar();

  @override
  Widget build(BuildContext context, HomeViewModel homeViewModel) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.paddingOf(context).top + baseline,
        left: baseline_2x,
        right: baseline_2x,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Assets.img.avatar.image().clipOval().wh(baseline_6x, baseline_6x),
          Assets.svg.logo.svg(width: baseline_6x, height: baseline_6x),
          IconButton(
            onPressed: homeViewModel.logout,
            icon: const Icon(
              Icons.logout_rounded,
              color: Vx.red500,
            ),
          ),
        ],
      ),
    );
  }
}

class CandidateHomeView extends ViewModelWidget<HomeViewModel> {
  const CandidateHomeView({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        baseline_2x.heightBox,
        "Hello ${viewModel.user!.fullname}."
            .text
            .gray400
            .semiBold
            .make()
            .px16(),
        [
          "Find your\ncreative job".text.extraBold.size(baseline_4x).make(),
        ].vStack().px12(),
        baseline_3x.heightBox,
        StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Card(
                elevation: 0,
                color: Vx.hexToColor("#AFECFE"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.img.search.image(height: baseline_5x),
                    "${viewModel.remoteJobs.length}"
                        .text
                        .bold
                        .color(primaryColor)
                        .size(baseline_2x)
                        .make()
                        .py8(),
                    "Remote Job".text.color(primaryColor).make(),
                  ],
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: Card(
                elevation: 0,
                color: Vx.hexToColor("#BEAFFE"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "${viewModel.fullTimeJobs.length}"
                        .text
                        .bold
                        .color(primaryColor)
                        .size(baseline_2x)
                        .make()
                        .py8(),
                    "Full Time".text.color(primaryColor).make(),
                  ],
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: Card(
                elevation: 0,
                color: Vx.hexToColor("#FFD6AD"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "${viewModel.partTimeJobs.length}"
                        .text
                        .bold
                        .color(primaryColor)
                        .size(baseline_2x)
                        .make()
                        .py8(),
                    "Part Time".text.color(primaryColor).make(),
                  ],
                ),
              ),
            ),
          ],
        ).p8(),
        ["Recent Job List".text.bold.size(baseline_2x).make()].hStack().p16(),
        ...viewModel.jobs.map((e) {
          return JobCard(
            job: e,
            isFavorite: viewModel.favoriteJobs.contains(e.id),
            onFav: () {
              if (!viewModel.favoriteJobs.contains(e.id)) {
                viewModel.addToFavorite(e);
              } else {
                viewModel.removeFromFavorite(e.id);
              }
            },
          );
        })
      ],
    ).scrollVertical();
  }
}

class EntrepriseHomeView extends StatelessWidget {
  const EntrepriseHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
