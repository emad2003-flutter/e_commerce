// 1. جميع الـ Imports تكون هنا في البداية
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/domain/entities/register_response_entity.dart';
import 'package:e_commerce/domain/use_cases/register_use_case.dart';

// 2. تعريف الـ States
abstract class RegisterState {}

class RegisterInitialStates extends RegisterState {}

class RegisterLoadingStates extends RegisterState {}

class RegisterSuccessStates extends RegisterState {
  final RegisterResponseEntity registerResponseEntity;
  RegisterSuccessStates({required this.registerResponseEntity});
}

class RegisterErrorStates extends RegisterState {
  final Failure failure;
  RegisterErrorStates({required this.failure});
}

// import 'package:e_commerce/core/errors/fialures.dart';
// import 'package:e_commerce/domain/entities/register_response_entity.dart';

//  class RegisterState {
// }
// class RegisterInitialStates extends RegisterState {}
// class RegisterLoadingStates extends RegisterState {}
// class RegisterSuccessStates extends RegisterState {
//   RegisterResponseEntity registerResponseEntity;
//   RegisterSuccessStates({required this.registerResponseEntity});
// }
// class RegisterErrorStates extends RegisterState {
//   Failure failure;
//   RegisterErrorStates({required this.failure});
// }
