import 'package:json_annotation/json_annotation.dart';

import '../grpc/csu.pbgrpc.dart' as pb;
import 'subject.dart';

part 'day.g.dart';

@JsonSerializable()
class DayEntity {
  const DayEntity({
    required this.weekday,
    required this.subjects,
  });

  factory DayEntity.fromPb(pb.Day day) {
    var subjects = <SubjectEntity>[];
    for (final subject in day.subjects) {
      subjects.add(SubjectEntity.fromPb(subject));
    }
    return DayEntity(weekday: day.weekday, subjects: subjects);
  }

  factory DayEntity.fromJson(Map<String, dynamic> json) => _$DayEntityFromJson(json);

  final int weekday;
  final List<SubjectEntity> subjects;

  Map<String, dynamic> toJson() => _$DayEntityToJson(this);
}
