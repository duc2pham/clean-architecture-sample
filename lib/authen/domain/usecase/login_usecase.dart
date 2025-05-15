import '../entity/user_entity.dart';
import '../repository/authen_repository.dart';

class LoginUseCase {
  final AuthenticateRepository _repository;

  LoginUseCase(this._repository);

  Future<UserEntity> call(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw ArgumentError('Email and password cannot be empty.');
    }
    try {
      final userEntity = await _repository.login(email, password);
      return userEntity;
    } catch (e) {
      rethrow;
    }
  }
}
