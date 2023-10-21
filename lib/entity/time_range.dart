import 'package:flutter/material.dart';

class TimeRange {
  const TimeRange({
    required this.start,
    required this.end,
  });

  final TimeOfDay start;
  final TimeOfDay end;

  String format(BuildContext context) => "${start.format(context)} - ${end.format(context)}";
}
