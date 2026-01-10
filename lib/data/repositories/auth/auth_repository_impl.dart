import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/domain/entities/register_response_entity.dart';
import 'package:e_commerce/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, RegisterResponseEntity>> register(String name, String email, String password, String rePassword, String phone) {
    // TODO: implement register
    throw UnimplementedError();
  }
  
}