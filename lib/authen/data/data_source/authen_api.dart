import 'dart:math';

import '../model/user_request_model.dart';
import '../model/user_response_model.dart';
import 'authen_data_source.dart';

/// Mock implementation of [AuthenDataSource] simulating remote API calls.
class AuthenAPI implements AuthenDataSource {
  @override
  Future<UserResponse> login(UserRequest request) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    // Simulate potential API errors (e.g., 10% chance of failure)
    if (Random().nextInt(10) == 0) {
      throw Exception('Invalid credentials'); // Simulate API error
    }

    // Simulate a successful API response
    // In a real scenario, you would parse the actual JSON response body here
    final mockApiResponse = {
      "firstName": "Duc",
      "lastName": "Pham",
      "gender": true,
      "team": "Flutter",
      "engineeringLevel": "G2"
    };

    return UserResponse.fromJson(mockApiResponse); // Use fromJson
  }

  @override
  Future<bool> forwardPassword(String email) async {
    throw UnimplementedError();
  }
}
