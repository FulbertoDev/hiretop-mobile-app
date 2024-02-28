import 'package:hiretop_mobile_app/data/fake/fake_data.dart';
import 'package:hiretop_mobile_app/data/models/job/application_dto.dart';
import 'package:hiretop_mobile_app/data/models/job/job_dto.dart';
import 'package:hiretop_mobile_app/data/models/user/user_dto.dart';
import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';

import '../app/app.logger.dart';
import '../ui/utils/db_utils.dart';

class JobService with ListenableServiceMixin {
  final logger = getLogger("JobService");

  final ReactiveValue<List<JobDto>> _jobs = ReactiveValue([]);
  List<JobDto> get jobs => _jobs.value;

  final ReactiveValue<List<JobDto>> _favoriteJobs =
      ReactiveValue(Hive.box<JobDto>(DbUtils.favoriteBox).values.toList());

  List<JobDto> get favoriteJobs => _favoriteJobs.value;

  JobService() {
    listenToReactiveValues([_jobs, _favoriteJobs]);
    loadJobs();
    initWatcher();
  }

  void initWatcher() {
    Hive.box<JobDto>(DbUtils.favoriteBox).watch().listen((event) {
      logger.wtf("New changes on favorite box");
      _favoriteJobs.value =
          Hive.box<JobDto>(DbUtils.favoriteBox).values.toList();
    });
  }

  void loadJobs() {
    _jobs.value = FakeData.jobs;
  }

  Future saveToFavorites(JobDto job) =>
      Hive.box<JobDto>(DbUtils.favoriteBox).put(job.id, job);

  Future removeFromFavorites(int jobId) async {
    return await Hive.box<JobDto>(DbUtils.favoriteBox).delete(jobId);
  }

  Future<int> applyForJob({required JobDto jobDto, required UserDto userDto}) {
    final application = ApplicationDto(
      id: 1,
      job: jobDto,
      candidate: userDto,
      applicationDate: DateTime.now(),
    );
    return Hive.box<ApplicationDto>(DbUtils.applicationBox).add(application);
  }
}
