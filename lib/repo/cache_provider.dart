import 'package:flutter/material.dart';

import 'cache.dart';
import '../entity/entity.dart';

class CacheProvider extends ChangeNotifier {
  CacheProvider({
    ScheduleEntity? schedule,
    RetakesEntity? retakes,
  }) : _schedule = schedule, _retakes = retakes;

  ScheduleEntity? _schedule;
  RetakesEntity? _retakes;

  ScheduleEntity? get schedule => _schedule;
  RetakesEntity? get retakes => _retakes;

  void setSchedule(ScheduleEntity schedule) {
    _schedule = schedule;
    Cache.setSchedule(schedule);
    notifyListeners();
  }

  void setRetakes(RetakesEntity retakes) {
    _retakes = retakes;
    Cache.setRetakes(retakes);
    notifyListeners();
  }
}
