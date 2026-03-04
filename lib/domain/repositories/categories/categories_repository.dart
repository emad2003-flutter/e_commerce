import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/domain/entities/categories_response_entity.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, CategoriesResponseEntity>> getCategories();
}