import 'package:e_commerce/core/utils/app_consts.dart';
import 'package:e_commerce/core/utils/shared_pref_helper.dart';
import 'package:e_commerce/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:e_commerce/domain/use_cases/register_use_case.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
    : super(RegisterInitialStates());

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
      either.fold((failure) => emit(RegisterErrorStates(failure: failure)), (
        registerResponseEntity,
      ) {
        emit(
          RegisterSuccessStates(registerResponseEntity: registerResponseEntity),
        );
        saveToken(registerResponseEntity.token ?? "");
      });
    }
  }

  Future<void> saveToken(String token) async {
    await SharedPrefHelper.setData(AppConsts.userToken, token);
  }
}
