import 'package:clean_sample/authen/data/mapper/user_mapper.dart';
import 'package:clean_sample/authen/domain/entity/user_entity.dart';
import 'package:clean_sample/authen/domain/repository/authen_repository.dart';

import '../data_source/authen_data_source.dart';
import '../model/user_request_model.dart';
import '../model/user_response_model.dart';

class LoginRepositoryImpl implements AuthenticateRepository {
  final AuthenDataSource _dataSource;
  // Depend on the abstraction

  // Inject the data source via the constructor
  LoginRepositoryImpl(dataSource) : _dataSource = dataSource;

  @override
  Future<bool> forwardPassword(String email) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  Future<UserEntity> login(String email, String password) async {
    try {
      final request = UserRequest(email: email, password: password);

      final UserResponse response = await _dataSource.login(request);

      return response.toEntity;
    } catch (e) {
      /// TODO handle error
      rethrow; // Re-throwing for now
    }
  }
}
