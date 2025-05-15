import '../model/user_request_model.dart';
import '../model/user_response_model.dart';

/// Abstract class defining the contract for authentication data operations.
abstract class AuthenDataSource {
  
  Future<UserResponse> login(UserRequest request);

  Future<bool> forwardPassword(String email);
}