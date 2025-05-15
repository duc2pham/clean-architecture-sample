class UserResponse {
  UserResponse({
    this.firstName,
    this.abc,
    this.gender,
    this.team,
    this.engineeringLevel,
  });

  final String? firstName;
  final String? abc;
  final bool? gender;
  final String? team;

  /// G1, G2, G3, G4
  final String? engineeringLevel;

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      firstName: json['firstName'] as String?,
      abc: json['lastName'] as String?,
      gender: json['gender'] as bool?,
      team: json['team'] as String?,
      engineeringLevel: json['engineeringLevel'] as String?,
    );
  }
}
