import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  int get dayOfYear {
    return difference(DateTime(year)).inDays;
  }

  int get isoWeekNumber {
    int daysToAdd = DateTime.thursday - weekday;

    DateTime thursdayDate = daysToAdd > 0
        ? add(Duration(days: daysToAdd))
        : subtract(Duration(days: daysToAdd.abs()));

    int dayOfYearThursday = thursdayDate.dayOfYear;

    return 1 + ((dayOfYearThursday - 1) ~/ 7);
  }

  DateTime dateOnly() {
    return DateUtils.dateOnly(this);
  }
}
