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

  final String name;
  final String room;
  final LecturerEntity lecturer;
  final int number;
  final TimeRange timeRange;
  final DateTime date;
}
