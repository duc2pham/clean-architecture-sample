import '../../domain/entity/user_entity.dart';
import '../model/user_response_model.dart';

extension UserMapper on UserResponse {
  UserEntity get toEntity => UserEntity(
        firstName: firstName ?? '',
        lastName: abc ?? '',
        gender: gender ?? true,
        team: team ?? '',
        engineeringLevel: engineeringLevel ?? 'G1',
      );
}
