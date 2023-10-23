import 'subject.dart';

import '../grpc/csu.pbgrpc.dart' as pb;

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

  final int weekday;
  final List<SubjectEntity> subjects;
}
