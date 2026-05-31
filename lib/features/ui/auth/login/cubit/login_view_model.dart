import 'package:e_commerce/domain/use_cases/get_token_use_case.dart';
import 'package:e_commerce/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/domain/use_cases/set_token_use_case.dart';
import 'package:e_commerce/features/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  SetTokenUseCase setTokenUseCase;
  GetTokenUseCase getTokenUseCase;

  LoginViewModel({
    required this.loginUseCase,
    required this.setTokenUseCase,
    required this.getTokenUseCase,
  }) : super(LoginInitial());
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

  Future<void> SetToken(String token) async {
    await setTokenUseCase.call(token);
  }

  Future<String> getToken() async {
    return await getTokenUseCase.call();
  }
}
