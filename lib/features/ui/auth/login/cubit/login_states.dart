import 'package:e_commerce/domain/entities/login_response_entity.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponseEntity loginResponseEntity;
  LoginSuccess({required this.loginResponseEntity});
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}
