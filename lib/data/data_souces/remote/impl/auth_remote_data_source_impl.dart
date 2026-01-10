import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/data/data_souces/remote/auth_remote_data_source.dart';
import 'package:e_commerce/data/models/register_response_dto.dart';
import 'package:e_commerce/domain/entities/register_response_entity.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<Either<Failure, RegisterResponseDto>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
