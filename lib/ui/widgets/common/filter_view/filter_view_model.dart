import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../data/models/job/job_type.dart';
import '../../../common/app_enums.dart';

class FilterViewModel extends BaseViewModel {
  DateFilter? _dateFilter;
  DateFilter? get dateFilter => _dateFilter;

  double _minSalary = 10000;
  double get minSalary => _minSalary;

  double _maxSalary = 50000;
  double get maxSalary => _maxSalary;

  void setFilter(DateFilter filter) {
    _dateFilter = filter;
    notifyListeners();
  }

  JobType? _jobType;
  JobType? get jobType => _jobType;

  void setJobType(JobType jobType) {
    _jobType = jobType;
    notifyListeners();
  }

  void setSalaryRange(RangeValues values) {
    _minSalary = values.start;
    _maxSalary = values.end;
    notifyListeners();
  }
}
