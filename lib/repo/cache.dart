import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../entity/entity.dart';

class Cache {
  static const String scheduleKey = "schedule";
  static const String retakesKey = "retakes";

  static Future<ScheduleEntity?> getSchedule() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final scheduleStr = prefs.getString(scheduleKey);

      if (scheduleStr == null || scheduleStr.isEmpty) {
        return null;
      }

      final scheduleJson = jsonDecode(scheduleStr);

      return ScheduleEntity.fromJson(scheduleJson);
    } catch (_) {
      return null;
    }
  }

  static Future<bool> setSchedule(ScheduleEntity schedule) async {
    final prefs = await SharedPreferences.getInstance();
    final scheduleJson = schedule.toJson();
    final scheduleStr = jsonEncode(scheduleJson);
    return prefs.setString(scheduleKey, scheduleStr);
  }

  static Future<RetakesEntity?> getRetakes() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final retakesStr = prefs.getString(retakesKey);

      if (retakesStr == null || retakesStr.isEmpty) {
        return null;
      }

      final retakesJson = jsonDecode(retakesStr);

      return RetakesEntity.fromJson(retakesJson);
    } catch (_) {
      return null;
    }
  }

  static Future<bool> setRetakes(RetakesEntity retakes) async {
    final prefs = await SharedPreferences.getInstance();
    final retakesJson = retakes.toJson();
    final retakesStr = jsonEncode(retakesJson);
    return prefs.setString(retakesKey, retakesStr);
  }
}
