import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../grpc/csu.pbgrpc.dart' as pb;
import 'timeofday.dart';

part 'timerange.g.dart';

@JsonSerializable(converters: [TimeOfDayJsonConverter()])
class TimeRange {
  const TimeRange({
    required this.start,
    required this.end,
  });

  factory TimeRange.fromPb(pb.TimeRange timeRange) {
    return TimeRange(
      start: TimeOfDay(hour: timeRange.start.hour, minute: timeRange.start.minute),
      end: TimeOfDay(hour: timeRange.end.hour, minute: timeRange.end.minute),
    );
  }

  factory TimeRange.fromJson(Map<String, dynamic> json) => _$TimeRangeFromJson(json);

  final TimeOfDay start;
  final TimeOfDay end;

  String format(BuildContext context) => "${start.format(context)} - ${end.format(context)}";

  Map<String, dynamic> toJson() => _$TimeRangeToJson(this);
}
