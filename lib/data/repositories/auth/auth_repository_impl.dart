import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/data/data_souces/local/auth_local_data_source.dart';
import 'package:e_commerce/data/data_souces/remote/auth_remote_data_source.dart';
import 'package:e_commerce/data/models/login_response_dto.dart';
import 'package:e_commerce/domain/entities/register_response_entity.dart';
import 'package:e_commerce/domain/repositories/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    var either = await remoteDataSource.register(
      name,
      email,
      password,
      rePassword,
      phone,
    );
    return either.fold(
      (error) => Left(error),
      (registerResponseEntity) => Right(registerResponseEntity),
    );
  }

  @override
  Future<Either<Failure, LoginResponseDto>> login(
    String email,
    String password,
  ) async {
    var either = await remoteDataSource.login(email, password);
    return either.fold(
      (error) => Left(error),
      (loginResponseDto) => Right(loginResponseDto),
    );
  }

  @override
  Future<String> getToken() {
    return localDataSource.getToken();
  }

  @override
  Future<void> setToken(String token) {
    return localDataSource.setToken(token);
  }
}
