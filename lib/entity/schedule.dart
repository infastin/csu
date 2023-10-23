import 'day.dart';

import '../grpc/csu.pbgrpc.dart' as pb;

class ScheduleEntity {
  const ScheduleEntity({
    required this.oddWeek,
    required this.evenWeek
  });

  factory ScheduleEntity.fromPb(pb.ScheduleResponse schedule) {
    var oddWeek = <DayEntity>[];
    var evenWeek = <DayEntity>[];

    for (final day in schedule.oddWeek) {
      oddWeek.add(DayEntity.fromPb(day));
    }

    for (final day in schedule.evenWeek) {
      evenWeek.add(DayEntity.fromPb(day));
    }

    return ScheduleEntity(
      oddWeek: oddWeek,
      evenWeek: evenWeek
    );
  }

  List<DayEntity> getWeek(int week) => (week % 2 == 0) ? oddWeek : evenWeek;

  final List<DayEntity> oddWeek;
  final List<DayEntity> evenWeek;
}
