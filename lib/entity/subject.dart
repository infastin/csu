import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_annotation/json_annotation.dart';

import '../grpc/csu.pbgrpc.dart' as pb;

import 'lecturer.dart';
import 'timerange.dart';

part 'subject.g.dart';

@JsonEnum(fieldRename: FieldRename.screamingSnake)
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
    return switch (this) {
      unknown => loc.unknown,
      lecture => loc.lecture,
      practice => loc.practice,
      lab => loc.lab,
    };
  }
}

@JsonSerializable()
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

  factory SubjectEntity.fromJson(Map<String, dynamic> json) => _$SubjectEntityFromJson(json);

  final String name;
  final String room;
  final SubjectType type;
  final LecturerEntity lecturer;
  final int number;
  final TimeRange timeRange;

  Map<String, dynamic> toJson() => _$SubjectEntityToJson(this);
}
