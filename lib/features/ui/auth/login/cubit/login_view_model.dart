import 'package:e_commerce/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/features/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}) : super(LoginInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void login() async {
    emit(LoginLoading());
    var either = await loginUseCase.invoke(
      emailController.text,
      passwordController.text,
    );
    either.fold(
      (error) => emit(LoginFailure(error.message)),
      (loginResponseDto) =>
          emit(LoginSuccess(loginResponseEntity: loginResponseDto)),
    );
  }
}
