import 'package:bloc_test/bloc_test.dart';
import 'package:clean_sample/authen/domain/entity/user_entity.dart';
import 'package:clean_sample/authen/domain/usecase/login_usecase.dart';
import 'package:clean_sample/authen/presentation/bloc/login_cubit.dart';
import 'package:clean_sample/authen/presentation/bloc/login_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Generate mocks by running: flutter pub run build_runner build --delete-conflicting-outputs
@GenerateMocks([LoginUseCase])
import 'login_cubit_test.mocks.dart'; // This file will be generated

void main() {
  late LoginCubit loginCubit;
  late MockLoginUseCase mockLoginUseCase;

  // Dummy UserEntity for when LoginUseCase succeeds
  final tUserEntity = UserEntity(
    firstName: 'Test',
    lastName: 'User',
    gender: true,
    team: 'Test Team',
    engineeringLevel: 'G1',
  );

  const tEmail = 'test@example.com';
  const tPassword = 'password123';

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    loginCubit = LoginCubit(mockLoginUseCase);
  });

  tearDown(() {
    loginCubit.close();
  });

  test('initial state should be LoginInitial', () {
    expect(loginCubit.state, LoginInitial());
  });

  group('login', () {
    blocTest<LoginCubit, LoginState>(
      'emits [LoginLoading, LoginSuccess] when LoginUseCase succeeds',
      build: () {
        // Arrange
        when(mockLoginUseCase.call(tEmail, tPassword))
            .thenAnswer((_) async => tUserEntity);
        return loginCubit;
      },
      act: (cubit) => cubit.login(email: tEmail, password: tPassword),
      expect: () =>  <LoginState>[
        LoginLoading(),
        LoginSuccess(),
      ],
      verify: (_) {
        verify(mockLoginUseCase.call(tEmail, tPassword)).called(1);
      },
    );

    blocTest<LoginCubit, LoginState>(
      'emits [LoginLoading, LoginFailed] when LoginUseCase throws an error',
      build: () {
        // Arrange
        when(mockLoginUseCase.call(tEmail, tPassword))
            .thenThrow(Exception('Login failed!'));
        return loginCubit;
      },
      act: (cubit) => cubit.login(email: tEmail, password: tPassword),
      expect: () => <LoginState>[
        LoginLoading(),
        LoginFailed(),
      ],
      verify: (_) {
        verify(mockLoginUseCase.call(tEmail, tPassword)).called(1);
      },
    );
  });
}