class LecturerEntity {
  const LecturerEntity({
    required this.firstName,
    required this.lastName,
    required this.middleName,
  });

  final String firstName;
  final String lastName;
  final String middleName;

  @override
  String toString() => "$lastName $firstName $middleName";
}
