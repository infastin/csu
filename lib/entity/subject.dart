import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'lecturer.dart';
import 'time_range.dart';

enum SubjectType {
  lecture,
  practice,
  lab;

  String localize(AppLocalizations loc) {
    switch (this) {
    case lecture:
      return loc.lecture;
    case practice:
      return loc.practice;
    case lab:
      return loc.lab;
    }
  }
}

class SubjectEntity {
  const SubjectEntity({
    required this.name,
    required this.room,
    required this.type,
    required this.lecturer,
    required this.number,
    required this.timeRange,
  });

  final String name;
  final String room;
  final SubjectType type;
  final LecturerEntity lecturer;
  final int number;
  final TimeRange timeRange;
}
