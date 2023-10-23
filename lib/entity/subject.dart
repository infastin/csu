import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../grpc/csu.pbgrpc.dart' as pb;

import 'lecturer.dart';
import 'time_range.dart';

enum SubjectType {
  unknown,
  lecture,
  practice,
  lab;

  factory SubjectType.fromPb(pb.Subject_SubjectType type) {
    return switch (type) {
      pb.Subject_SubjectType.LECTURE => lecture,
      pb.Subject_SubjectType.PRACTICE => practice,
      pb.Subject_SubjectType.LAB => lab,
      _ => unknown
    };
  }

  String localize(AppLocalizations loc) {
    switch (this) {
    case unknown:
      return loc.unknown;
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

  factory SubjectEntity.fromPb(pb.Subject subject) {
    return SubjectEntity(
      name: subject.name,
      room: subject.room,
      type: SubjectType.fromPb(subject.type),
      lecturer: LecturerEntity.fromPb(subject.lecturer),
      number: subject.number,
      timeRange: TimeRange.fromPb(subject.timeRange),
    );
  }

  final String name;
  final String room;
  final SubjectType type;
  final LecturerEntity lecturer;
  final int number;
  final TimeRange timeRange;
}
