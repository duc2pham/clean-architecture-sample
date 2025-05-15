import '../entity/user_entity.dart';

abstract class AuthenticateRepository {
  Future<UserEntity> login(String email, String password);
  Future<bool> forwardPassword(String email);
}
