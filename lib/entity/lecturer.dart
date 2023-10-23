import '../grpc/csu.pbgrpc.dart' as pb;

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

  final String firstName;
  final String lastName;
  final String middleName;

  @override
  String toString() => "$lastName $firstName $middleName";
}
