import 'package:flutter/material.dart';

import '../grpc/generated/csu.pbgrpc.dart' as pb;

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

  final TimeOfDay start;
  final TimeOfDay end;

  String format(BuildContext context) => "${start.format(context)} - ${end.format(context)}";
}
