import '../grpc/csu.pbgrpc.dart' as pb;

import 'time_range.dart';
import 'lecturer.dart';

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

  final String name;
  final String room;
  final LecturerEntity lecturer;
  final int number;
  final TimeRange timeRange;
  final DateTime date;
}
