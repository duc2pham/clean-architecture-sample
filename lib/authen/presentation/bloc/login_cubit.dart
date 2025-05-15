import 'package:clean_sample/authen/domain/usecase/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginInitial());

  final LoginUseCase _loginUseCase;

  void login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      await _loginUseCase.call(email, password);
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailed());
    }
  }
}
