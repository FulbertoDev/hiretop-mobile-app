import 'package:file_picker/file_picker.dart';
import 'package:hiretop_mobile_app/app/app.locator.dart';
import 'package:hiretop_mobile_app/app/app.logger.dart';
import 'package:hiretop_mobile_app/data/models/job/application_dto.dart';
import 'package:hiretop_mobile_app/data/models/job/job_dto.dart';
import 'package:hiretop_mobile_app/services/job_service.dart';
import 'package:hiretop_mobile_app/services/user_service.dart';
import 'package:hiretop_mobile_app/ui/utils/setup_snackbar_ui.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:velocity_x/velocity_x.dart';

enum CurrentDetailsView {
  description(label: "Description"),
  company(label: "Company"),
  apply(label: "");

  final String label;
  const CurrentDetailsView({required this.label});
}

class JobDetailsViewModel extends ReactiveViewModel {
  final _logger = getLogger("JobDetailsViewModel");
  final _jobService = locator<JobService>();
  final _userService = locator<UserService>();
  final _snackbarService = locator<SnackbarService>();
  final JobDto jobDto;

  JobDetailsViewModel(this.jobDto);

  CurrentDetailsView _currentDetailsView = CurrentDetailsView.description;
  CurrentDetailsView get currentDetailsView => _currentDetailsView;

  List<ApplicationDto> get applications => _userService.applications;

  List<JobDto> get favoriteJobs => _jobService.favoriteJobs;
  bool get isFavorite => favoriteJobs.map((e) => e.id).contains(jobDto.id);

  void setCurrentDetailsView(CurrentDetailsView detailsView) {
    _currentDetailsView = detailsView;
    notifyListeners();
  }

  String? _cvPath;
  int? _cvFileSize;
  int get cvFileSize => _cvFileSize ?? 0;
  String? _cvFileName;
  String get cvFileName => _cvFileName ?? "";
  bool get isCvPicked => _cvPath != null;

  bool _isJobApplied = false;
  bool get isJobApplied =>
      _isJobApplied ||
      applications.map((e) => e.job.id).toList().contains(jobDto.id);

  void pickResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      dialogTitle: "Choisir votre cv",
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result == null) return;
    if (result.count <= 0) return;
    final cvFile = result.files.first;
    _cvPath = cvFile.path;
    _cvFileSize = cvFile.size;
    _cvFileName = cvFile.name;
    notifyListeners();
  }

  void clearResume() async {
    _cvPath = null;
    _cvFileSize = null;
    _cvFileName = null;
    notifyListeners();
  }

  void addToFavorite() async {
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

  void removeFromFavorite() async {
    try {
      _logger.w("Removing");
      await _jobService.removeFromFavorites(jobDto.id);

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

  void apply() async {
    if (_userService.user == null) return;
    setBusy(true);
    try {
      await Future.delayed(2.seconds);
      final applicationId = await _jobService.applyForJob(
        jobDto: jobDto,
        userDto: _userService.user!,
      );
      _logger.wtf("Application ID: $applicationId");
      _snackbarService.showCustomSnackBar(
        message: "Candidature envoyée avec succès.",
        variant: SnackbarType.neutral,
      );
      _isJobApplied = true;
      notifyListeners();
    } catch (e) {
      _logger.e(e);
      _snackbarService.showCustomSnackBar(
        message: "Une erreur est survenue.",
        variant: SnackbarType.neutral,
      );
    } finally {
      setBusy(false);
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_jobService, _userService];
}
