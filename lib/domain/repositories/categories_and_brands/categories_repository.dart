import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/domain/entities/categories_or_brands_response_entity.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, CategoriesOrBrandsResponseEntity>> getCategories();
}
