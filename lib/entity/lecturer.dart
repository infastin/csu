import 'package:json_annotation/json_annotation.dart';

import '../grpc/csu.pbgrpc.dart' as pb;

part 'lecturer.g.dart';

@JsonSerializable()
class LecturerEntity {
  const LecturerEntity({
    required this.firstName,
    required this.lastName,
    required this.middleName,
  });

  factory LecturerEntity.fromPb(pb.Lecturer lecturer) {
    return LecturerEntity(
      firstName: lecturer.firstName,
      lastName: lecturer.lastName,
      middleName: lecturer.middleName
    );
  }

  factory LecturerEntity.fromJson(Map<String, dynamic> json) => _$LecturerEntityFromJson(json);

  final String firstName;
  final String lastName;
  final String middleName;

  @override
  String toString() => "$lastName $firstName $middleName";

  Map<String, dynamic> toJson() => _$LecturerEntityToJson(this);
}
