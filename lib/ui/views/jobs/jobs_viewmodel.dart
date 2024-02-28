import 'package:hiretop_mobile_app/app/app.locator.dart';
import 'package:hiretop_mobile_app/app/app.logger.dart';
import 'package:hiretop_mobile_app/data/models/job/job_dto.dart';
import 'package:hiretop_mobile_app/services/job_service.dart';
import 'package:hiretop_mobile_app/ui/widgets/common/filter_view/filter_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../utils/setup_snackbar_ui.dart';

class JobsViewModel extends ReactiveViewModel {
  final _jobService = locator<JobService>();
  final _snackbarService = locator<SnackbarService>();
  final _logger = getLogger("JobsViewModel");

  List<JobDto> get _allJobs => _jobService.jobs;
  List<int> get favs => _jobService.favoriteJobs.map((e) => e.id).toList();

  List<JobDto> get jobs => _allJobs;

  void addToFavorite(JobDto jobDto) async {
    try {
      _logger.w("Adding");
      final id = await _jobService.saveToFavorites(jobDto);
      _logger.w("Added: $id");
      _snackbarService.showCustomSnackBar(
        message: "Offre ajouté à vos favoris",
        variant: SnackbarType.neutral,
      );
    } catch (e) {
      _logger.e(e);
      _snackbarService.showCustomSnackBar(
        message: "Une erreur est survenue.",
        variant: SnackbarType.neutral,
      );
    }
  }

  void removeFromFavorite(int id) async {
    _logger.w("Removing $id");
    try {
      await _jobService.removeFromFavorites(id);

      _snackbarService.showCustomSnackBar(
        message: "Offre supprimé de vos favoris",
        variant: SnackbarType.neutral,
      );
    } catch (e) {
      _logger.e(e);

      _snackbarService.showCustomSnackBar(
        message: "Une erreur est survenue.",
        variant: SnackbarType.neutral,
      );
    }
  }

  void setFilter() async {
    final result =
        await locator<NavigationService>().navigateToView(const FilterView());
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_jobService];
}
