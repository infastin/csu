import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../entity/entity.dart';

class Cache {
  static const String _scheduleKey = "schedule";
  static const String _retakesKey = "retakes";
  static const String _groupsKey = "groups";
  static const String _timetableKey = "timetable";

  static Future<T?> _getByKey<T>(String key, T Function(Map<String, dynamic>) fromJson) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final str = prefs.getString(key);

      if (str == null || str.isEmpty) {
        return null;
      }

      final json = jsonDecode(str);

      return fromJson(json);
    } catch (_) {
      return null;
    }
  }

  static Future<bool> _setWithKey(String key, Map<String, dynamic> Function() toJson) async {
    final prefs = await SharedPreferences.getInstance();
    final json = toJson();
    final str = jsonEncode(json);
    return prefs.setString(key, str);
  }

  static Future<ScheduleEntity?> getSchedule() async =>
    await _getByKey(_scheduleKey, ScheduleEntity.fromJson);

  static Future<bool> setSchedule(ScheduleEntity schedule) async =>
    await _setWithKey(_scheduleKey, schedule.toJson);

  static Future<RetakesEntity?> getRetakes() async =>
    await _getByKey(_retakesKey, RetakesEntity.fromJson);

  static Future<bool> setRetakes(RetakesEntity retakes) async =>
    await _setWithKey(_retakesKey, retakes.toJson);

  static Future<GroupsEntity?> getGroups() async =>
    await _getByKey(_groupsKey, GroupsEntity.fromJson);

  static Future<bool> setGroups(GroupsEntity groups) async =>
    await _setWithKey(_groupsKey, groups.toJson);

  static Future<TimeTableEntity?> getTimeTable() async =>
    await _getByKey(_timetableKey, TimeTableEntity.fromJson);

  static Future<bool> setTimeTable(TimeTableEntity timetable) async =>
    await _setWithKey(_timetableKey, timetable.toJson);
}
