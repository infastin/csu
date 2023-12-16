import 'package:flutter/material.dart';

import 'cache.dart';
import '../entity/entity.dart';

class CacheProvider extends ChangeNotifier {
  CacheProvider({
    ScheduleEntity? schedule,
    RetakesEntity? retakes,
    GroupsEntity? groups,
    TimeTableEntity? timetable,
  }) : _schedule = schedule
     , _retakes = retakes
     , _groups = groups
     , _timetable = timetable;

  ScheduleEntity? _schedule;
  RetakesEntity? _retakes;
  GroupsEntity? _groups;
  TimeTableEntity? _timetable;

  ScheduleEntity? get schedule => _schedule;
  RetakesEntity? get retakes => _retakes;
  GroupsEntity? get groups => _groups;
  TimeTableEntity? get timetable => _timetable;

  void setGroups(GroupsEntity groups) {
    _groups = groups;
    Cache.setGroups(groups);
    notifyListeners();
  }

  void setTimeTable(TimeTableEntity timetable) {
    _timetable = timetable;
    Cache.setTimeTable(timetable);
    notifyListeners();
  }

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
