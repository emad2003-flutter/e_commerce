import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/domain/entities/register_response_entity.dart';

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
