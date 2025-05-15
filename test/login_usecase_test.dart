import 'package:clean_sample/authen/domain/entity/user_entity.dart';
import 'package:clean_sample/authen/domain/repository/authen_repository.dart';
import 'package:clean_sample/authen/domain/usecase/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_usecase_test.mocks.dart';

@GenerateMocks([AuthenticateRepository])

void main() {
  late MockAuthenticateRepository mockRepository;
  late LoginUseCase loginUseCase;

  setUp(() {
    mockRepository = MockAuthenticateRepository();
    loginUseCase = LoginUseCase(mockRepository);
  });

  test('should return UserEntity when login is successful', () async {
    const email = 'test@example.com';
    const password = 'password123';
    final user = UserEntity(
        firstName: 'firstName',
        lastName: 'lastName',
        gender: true,
        team: 'team',
        engineeringLevel: 'engineeringLevel');

    when(mockRepository.login(email, password)).thenAnswer((_) async => user);

    final result = await loginUseCase.call(email, password);

    expect(result, user);
    verify(mockRepository.login(email, password)).called(1);
  });

  test('should throw ArgumentError when email or password is empty', () {
    expect(() => loginUseCase.call('', 'password'), throwsArgumentError);
    expect(
        () => loginUseCase.call('email@example.com', ''), throwsArgumentError);
  });

  test('should rethrow exception when login fails', () async {
    const email = 'test@example.com';
    const password = 'wrongpassword';

    when(mockRepository.login(email, password))
        .thenThrow(Exception('Login failed'));

    expect(() => loginUseCase.call(email, password), throwsException);
  });
}
