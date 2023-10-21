import 'day.dart';

class WeekEntity {
  const WeekEntity({
    required this.isEven,
    required this.days,
  });

  final bool isEven;
  final List<DayEntity> days;
}
