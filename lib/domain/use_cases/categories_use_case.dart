import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/domain/entities/categories_or_brands_response_entity.dart';
import 'package:e_commerce/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesUseCase {
  final HomeRepository homeRepository;
  CategoriesUseCase({required this.homeRepository});
  Future<Either<Failure, CategoriesOrBrandsResponseEntity>> call() {
    return homeRepository.getCategories();
  }
}
