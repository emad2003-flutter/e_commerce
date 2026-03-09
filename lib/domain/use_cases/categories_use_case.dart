import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/domain/entities/categories_or_brands_response_entity.dart';
import 'package:e_commerce/domain/repositories/categories_and_brands/categories_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesUseCase {
  CategoriesRepository categoriesRepository;
  CategoriesUseCase({required this.categoriesRepository});
  Future<Either<Failure, CategoriesOrBrandsResponseEntity>> call() {
    return categoriesRepository.getCategories();
  }
}
