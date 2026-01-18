import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/data/models/login_response_dto.dart';
import 'package:e_commerce/domain/entities/register_response_entity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  );

  Future<Either<Failure, LoginResponseDto>> login(
    String email,
    String password,
  );
}
