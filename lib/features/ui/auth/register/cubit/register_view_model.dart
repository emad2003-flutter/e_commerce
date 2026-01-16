// 1. جميع الـ Imports تكون هنا في البداية
import 'package:e_commerce/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/domain/entities/register_response_entity.dart';
import 'package:e_commerce/domain/use_cases/register_use_case.dart';

// 3. الكلاس الأساسي الـ ViewModel
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
      either.fold(
        (failure) => emit(RegisterErrorStates(failure: failure)),
        (registerResponseEntity) => emit(
          RegisterSuccessStates(registerResponseEntity: registerResponseEntity),
        ),
      );
    }
  }
}

// import 'package:e_commerce/domain/use_cases/register_use_case.dart';
// import 'package:e_commerce/features/ui/auth/register/cubit/register_states.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';

// @injectable
// class RegisterViewModel extends Cubit<RegisterState> {
//   RegisterUseCase registerUseCase;
//     RegisterViewModel({required this.registerUseCase})
//       : super(RegisterInitialStates());
//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController mailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController rePasswordController = TextEditingController();
//   var formKey = GlobalKey<FormState>();

//   void register()async {
//     if (formKey.currentState!.validate()) {
//       emit(RegisterLoadingStates());
//       var either = await  registerUseCase.invoke(
//         fullNameController.text,
//         mailController.text,
//         passwordController.text,
//         rePasswordController.text,
//         phoneController.text,
//       );
//       either.fold(
//         (failure) => emit(RegisterErrorStates(failure: failure)),
//         (registerResponseEntity) => emit(RegisterSuccessStates(registerResponseEntity: registerResponseEntity)),
//       );
//     }
//   }
// }
