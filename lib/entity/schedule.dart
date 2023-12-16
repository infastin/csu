import 'package:json_annotation/json_annotation.dart';

import '../grpc/csu.pbgrpc.dart' as pb;
import 'day.dart';

part 'schedule.g.dart';

@JsonSerializable()
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

  factory ScheduleEntity.fromJson(Map<String, dynamic> json) => _$ScheduleEntityFromJson(json);

  final List<DayEntity> oddWeek;
  final List<DayEntity> evenWeek;

  bool get isEmpty => oddWeek.isEmpty && evenWeek.isEmpty;
  bool get isNotEmpty => !isEmpty;

  List<DayEntity> getWeek(int week) => (week % 2 == 0) ? oddWeek : evenWeek;

  Map<String, dynamic> toJson() => _$ScheduleEntityToJson(this);
}
