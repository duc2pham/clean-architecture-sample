class UserEntity {
  UserEntity({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.team,
    required this.engineeringLevel,
  });

  final String firstName;
  final String lastName;
  final bool gender;
  final String team;

  /// G1, G2, G3, G4
  final String engineeringLevel;

  String get fullName => firstName + lastName;
}
