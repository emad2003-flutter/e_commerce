import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart' show Failure;
import 'package:e_commerce/domain/entities/categories_response_entity.dart';

abstract class CategoriesRemoteDataSource {
  Future<Either<Failure, CategoriesResponseEntity>> getCategories();
}