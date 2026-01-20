import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/features/Auth/data/data_source/auth_remote_data_source.dart';
import 'package:products/features/Auth/presentation/cubits/auth_state.dart';

class LoginCubit extends Cubit<AuthState> {
  LoginCubit() : super(AuthInitial());

  Future<void> login({
    required String emailController,
    required String passwordController,
  }) async {
    AuthRemoteDataSource remoteDataSource = AuthRemoteDataSource();
    emit(LogingLoading());
    await remoteDataSource
        .login(
          emailController: emailController,
          passwordController: passwordController,
        )
        .then(
          (value) {
            emit(LoginSuccess());
          },
          onError: (error) {
            log('Login Error: $error');
            emit(LoginFailure(message: error.toString()));
          },
        );
  }
}
