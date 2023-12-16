import 'package:json_annotation/json_annotation.dart';

import '../grpc/csu.pbgrpc.dart' as pb;
import 'timerange.dart';

part 'timetable.g.dart';

@JsonSerializable()
class TimeTableEntity {
  const TimeTableEntity({ required this.timetable });

  factory TimeTableEntity.fromPb(pb.TimeTableResponse resp) {
    var timetable = <TimeRange>[];
    for (final timerange in resp.timetable) {
      timetable.add(TimeRange.fromPb(timerange));
    }
    return TimeTableEntity(timetable: timetable);
  }

  factory TimeTableEntity.fromJson(Map<String, dynamic> json) => _$TimeTableEntityFromJson(json);

  final List<TimeRange> timetable;

  bool get isEmpty => timetable.isEmpty;
  bool get isNotEmpty => !isEmpty;

  Map<String, dynamic> toJson() => _$TimeTableEntityToJson(this);
}
