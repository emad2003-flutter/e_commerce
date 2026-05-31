import 'package:e_commerce/domain/use_cases/get_token_use_case.dart';
import 'package:e_commerce/domain/use_cases/set_token_use_case.dart';
import 'package:e_commerce/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:e_commerce/domain/use_cases/register_use_case.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  final SetTokenUseCase setTokenUseCase;
  final GetTokenUseCase getTokenUseCase;

  RegisterViewModel({
    required this.registerUseCase,
    required this.setTokenUseCase,
    required this.getTokenUseCase,
  }) : super(RegisterInitialStates());

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingStates());
      var either = await registerUseCase.invoke(
        fullNameController.text,
        mailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text,
      );
      either.fold(
        (failure) => emit(RegisterErrorStates(failure: failure)),
        (registerResponseEntity) => emit(
          RegisterSuccessStates(registerResponseEntity: registerResponseEntity),
        ),
      );
    }
  }

  Future<void> SetToken(String token) async {
    await setTokenUseCase.call(token);
  }

  Future<String> getToken() async {
    return await getTokenUseCase.call();
  }
}
