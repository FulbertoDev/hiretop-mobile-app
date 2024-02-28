import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hiretop_mobile_app/app/app.locator.dart';
import 'package:hiretop_mobile_app/app/app.router.dart';
import 'package:hiretop_mobile_app/data/models/job/job_dto.dart';
import 'package:hiretop_mobile_app/gen/assets.gen.dart';
import 'package:hiretop_mobile_app/ui/common/app_colors.dart';
import 'package:hiretop_mobile_app/ui/common/ui_helpers.dart';
import 'package:hiretop_mobile_app/ui/widgets/common/custom_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:timeago/timeago.dart' as tg;

import 'job_details_viewmodel.dart';

class JobDetailsView extends StackedView<JobDetailsViewModel> {
  final JobDto job;
  const JobDetailsView({Key? key, required this.job}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    JobDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: primaryColor,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("Détails"),
        actions: [
          if (viewModel.isFavorite)
            IconButton(
              onPressed: viewModel.removeFromFavorite,
              icon: const Icon(
                Icons.bookmark_rounded,
              ),
            )
          else
            IconButton(
              onPressed: viewModel.addToFavorite,
              icon: const Icon(
                Icons.bookmark_outline_rounded,
              ),
            ),
        ],
        leading: IconButton(
          onPressed: () {
            locator<NavigationService>().back();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 2.9,
            child: Stack(
              children: [
                [
                  job.jobPosition.text.bold
                      .color(primaryColor)
                      .size(baseline_2x)
                      .makeCentered(),
                  baseline_2x.heightBox,
                  [
                    job.company.name.text.medium.make(),
                    VxBox()
                        .make()
                        .box
                        .roundedFull
                        .color(primaryColor)
                        .make()
                        .wh(semiBaseline, semiBaseline),
                    job.company.location.city.text.medium.makeCentered(),
                    VxBox()
                        .make()
                        .box
                        .roundedFull
                        .color(primaryColor)
                        .make()
                        .wh(semiBaseline, semiBaseline),
                    tg.format(job.publishedAt).text.medium.make(),
                  ].hStack(alignment: MainAxisAlignment.spaceAround),
                ]
                    .vStack()
                    .py24()
                    .box
                    .color(Vx.hexToColor("#F3F2F2"))
                    .make()
                    .positioned(bottom: 0, left: 0, right: 0),
                Assets.svg.logo.svg().positioned(top: 0, left: 0, right: 0),
              ],
            ),
          ).py16(),
          Row(
            children: CurrentDetailsView.values.getRange(0, 2).map(
              (e) {
                final isSelected = e == viewModel.currentDetailsView;
                return TextButton(
                  onPressed: () {
                    viewModel.setCurrentDetailsView(e);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: baseline_2x_5),
                    backgroundColor: isSelected ? primaryColor : secondaryColor,
                    foregroundColor: isSelected ? Colors.white : primaryColor,
                  ),
                  child: e.label.text.make(),
                ).px16().expand();
              },
            ).toList(),
          ).hide(
            isVisible: viewModel.currentDetailsView != CurrentDetailsView.apply,
          ),
          Expanded(
              child: switch (viewModel.currentDetailsView) {
            CurrentDetailsView.description => const JobDescriptionWidgetView(),
            CurrentDetailsView.company => const CompanyDescriptionWidgetView(),
            CurrentDetailsView.apply => const ResumeUploadWidgetView()
          })
        ],
      ),
      bottomNavigationBar:
          viewModel.currentDetailsView == CurrentDetailsView.apply ||
                  viewModel.isJobApplied
              ? null
              : ElevatedButton(
                  onPressed: () {
                    viewModel.setCurrentDetailsView(CurrentDetailsView.apply);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size.fromHeight(baseline_6x_5),
                  ),
                  child: Text(
                    "Apply Now".toUpperCase(),
                  ),
                ).px16().safeArea(),
    );
  }

  @override
  JobDetailsViewModel viewModelBuilder(BuildContext context) =>
      JobDetailsViewModel(job);
}

class JobDescriptionWidgetView extends ViewModelWidget<JobDetailsViewModel> {
  const JobDescriptionWidgetView({super.key});

  @override
  Widget build(BuildContext context, JobDetailsViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Poste".text.hexColor("#150B3D").bold.make(),
        baseline_2x.heightBox,
        viewModel.jobDto.jobPosition.text.medium.make(),
        baseline_2x.heightBox,
        "Description du poste".text.hexColor("#150B3D").bold.make(),
        baseline_2x.heightBox,
        viewModel.jobDto.description.text.make(),
        baseline_2x.heightBox,
        "Pré requis".text.hexColor("#150B3D").bold.make(),
        ...viewModel.jobDto.requirements.map((e) => "• "
            .richText
            .size(baseline_3x)
            .withTextSpanChildren([
              e.textSpan.size(baseline_5_5).make(),
            ])
            .make()
            .py4()),
        baseline_2x.heightBox,
      ],
    ).p16();
  }
}

class CompanyDescriptionWidgetView
    extends ViewModelWidget<JobDetailsViewModel> {
  const CompanyDescriptionWidgetView({super.key});

  @override
  Widget build(BuildContext context, JobDetailsViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "À propos".text.hexColor("#150B3D").bold.make(),
        baseline.heightBox,
        viewModel.jobDto.company.description.text.make(),
        baseline_2x.heightBox,
        "Website".text.hexColor("#150B3D").bold.make(),
        baseline.heightBox,
        viewModel.jobDto.company.website.text.underline
            .hexColor("#7551FF")
            .underline
            .make(),
        baseline_2x.heightBox,
        "Taille de l'entreprise".text.hexColor("#150B3D").bold.make(),
        baseline.heightBox,
        "${viewModel.jobDto.company.employeeSize} employés".text.make(),
      ],
    ).p16();
  }
}

class ResumeUploadWidgetView extends ViewModelWidget<JobDetailsViewModel> {
  const ResumeUploadWidgetView({super.key});

  @override
  Widget build(BuildContext context, JobDetailsViewModel viewModel) {
    return viewModel.isJobApplied
        ? const ResumeUploadSuccessView()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Téléverser CV".text.hexColor("#150B3D").bold.make(),
              baseline.heightBox,
              "Ajouter votre cv pour postuler pour ce job".text.make(),
              baseline_2x.heightBox,
              DottedBorder(
                radius: Radius.circular(baseline),
                color: Vx.hexToColor("#9D97B5"),
                dashPattern: [defaultButtonRadius],
                strokeCap: StrokeCap.round,
                strokeWidth: 1,
                child: Container(
                  padding:
                      EdgeInsets.all(viewModel.isCvPicked ? baseline_2x : 0),
                  child: viewModel.isCvPicked
                      ? Column(
                          children: [
                            [
                              Assets.svg.pdfIcon.svg(),
                              baseline_2x.widthBox,
                              [
                                viewModel.cvFileName.text
                                    .color(primaryColor)
                                    .make(),
                                "${((viewModel.cvFileSize / 1024) / 1024).toDoubleStringAsFixed()} Mb"
                                    .text
                                    .hexColor("#AAA6B9")
                                    .make(),
                              ]
                                  .vStack(
                                    crossAlignment: CrossAxisAlignment.start,
                                  )
                                  .expand(),
                            ].hStack(),
                            baseline_2x.heightBox,
                            [
                              Assets.svg.deleteIcon.svg(),
                              baseline.widthBox,
                              "Remove file".text.hexColor("#FC4646").make(),
                            ].hStack().onTap(viewModel.clearResume),
                          ],
                        )
                      : Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Assets.svg.uploadResumeIcon.svg(),
                              baseline_2x.widthBox,
                              'Upload CV/Resume'
                                  .text
                                  .color(primaryColor)
                                  .size(baseline_5)
                                  .make(),
                            ],
                          ).py24(),
                        ),
                ),
              ).onTap(viewModel.pickResume),
              baseline_3x.heightBox,
              CustomButton(
                label: "Apply Now".toUpperCase(),
                isBusy: viewModel.isBusy,
                isEnabled: viewModel.isCvPicked,
                onPressed: viewModel.apply,
              ),
            ],
          ).p16().wFull(context);
  }
}

class ResumeUploadSuccessView extends ViewModelWidget<JobDetailsViewModel> {
  const ResumeUploadSuccessView({super.key});

  @override
  Widget build(BuildContext context, JobDetailsViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DottedBorder(
          radius: Radius.circular(baseline),
          color: Vx.hexToColor("#9D97B5"),
          dashPattern: [defaultButtonRadius],
          strokeCap: StrokeCap.round,
          strokeWidth: 1,
          child: Container(
            padding: EdgeInsets.all(viewModel.isCvPicked ? baseline_2x : 0),
            child: Column(
              children: [
                [
                  Assets.svg.pdfIcon.svg(),
                  baseline_2x.widthBox,
                  [
                    viewModel.cvFileName.text.color(primaryColor).make(),
                    "${((viewModel.cvFileSize / 1024) / 1024).toDoubleStringAsFixed()} Mb"
                        .text
                        .hexColor("#AAA6B9")
                        .make(),
                  ]
                      .vStack(
                        crossAlignment: CrossAxisAlignment.start,
                      )
                      .expand(),
                ].hStack(),
              ],
            ),
          ),
        ),
        Assets.svg.successfulIllustration.svg().py24(),
        "Félicitations, votre candidature a été soumise."
            .text
            .semiBold
            .size(baseline_2x_5)
            .make(),
        baseline_3x.heightBox,
        CustomButton(
          onPressed: () {
            locator<NavigationService>().clearStackAndShow(Routes.homeView);
          },
          label: "Retour à l'accueil".toUpperCase(),
        ),
      ],
    ).p16();
  }
}
