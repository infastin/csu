import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class TimeOfDayJsonConverter implements JsonConverter<TimeOfDay, String> {
  const TimeOfDayJsonConverter();

  @override
  TimeOfDay fromJson(String json) {
    final parts = json.split(":");
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  @override
  String toJson(TimeOfDay object) {
    return "${object.hour}:${object.minute}";
  }
}
