import 'package:csu/entity/timeofday.dart';
import 'package:json_annotation/json_annotation.dart';

import '../grpc/csu.pbgrpc.dart' as pb;
import 'lecturer.dart';
import 'timerange.dart';

part 'retake.g.dart';

@JsonSerializable(converters: [TimeOfDayJsonConverter()])
class RetakeEntity {
  const RetakeEntity({
    required this.name,
    required this.room,
    required this.lecturer,
    required this.number,
    required this.timeRange,
    required this.date,
  });

  factory RetakeEntity.fromPb(pb.Retake retake) {
    return RetakeEntity(
      name: retake.name,
      room: retake.room,
      lecturer: LecturerEntity.fromPb(retake.lecturer),
      number: retake.number,
      timeRange: TimeRange.fromPb(retake.timeRange),
      date: retake.date.toDateTime()
    );
  }

  factory RetakeEntity.fromJson(Map<String, dynamic> json) => _$RetakeEntityFromJson(json);

  final String name;
  final String room;
  final LecturerEntity lecturer;
  final int number;
  final TimeRange timeRange;
  final DateTime date;

  Map<String, dynamic> toJson() => _$RetakeEntityToJson(this);
}
