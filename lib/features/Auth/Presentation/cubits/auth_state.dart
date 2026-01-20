abstract class AuthState {}

class AuthInitial extends AuthState {}

class LogingLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {
  final String message;

  LoginFailure({required this.message});

}
