import 'subject.dart';

class DayEntity {
  const DayEntity({
    required this.weekday,
    required this.subjects,
  });

  final int weekday;
  final List<SubjectEntity> subjects;
}
