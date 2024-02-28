import 'package:hiretop_mobile_app/app/app.locator.dart';
import 'package:hiretop_mobile_app/app/app.logger.dart';
import 'package:hiretop_mobile_app/app/app.router.dart';
import 'package:hiretop_mobile_app/data/models/job/job_dto.dart';
import 'package:hiretop_mobile_app/data/models/user/user_dto.dart';
import 'package:hiretop_mobile_app/data/models/user/user_role.dart';
import 'package:hiretop_mobile_app/services/job_service.dart';
import 'package:hiretop_mobile_app/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../data/models/job/job_type.dart';
import '../../utils/setup_snackbar_ui.dart';

class HomeViewModel extends ReactiveViewModel {
  final _userService = locator<UserService>();
  final _jobService = locator<JobService>();

  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _logger = getLogger("HomeViewModel");

  UserDto? get user => _userService.user;

  UserRole get role => user?.role ?? UserRole.candidate;

  List<JobDto> get jobs => _jobService.jobs;
  List<JobDto> get remoteJobs => _jobService.jobs
      .filter((element) => element.jobType == JobType.remote)
      .toList();

  List<JobDto> get partTimeJobs => _jobService.jobs
      .filter((element) => element.jobType == JobType.partTime)
      .toList();
  List<JobDto> get fullTimeJobs => _jobService.jobs
      .filter((element) => element.jobType == JobType.fullTime)
      .toList();

  List<int> get favoriteJobs =>
      _jobService.favoriteJobs.map((e) => e.id).toList();

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

  void logout() async {
    _navigationService.navigateToLoginView();
    await _userService.clearData();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _userService,
        _jobService,
      ];
}
