import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'applications_viewmodel.dart';

class ApplicationsView extends StackedView<ApplicationsViewModel> {
  const ApplicationsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ApplicationsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  ApplicationsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ApplicationsViewModel();
}
