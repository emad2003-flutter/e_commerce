import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/domain/entities/categories_or_brands_response_entity.dart';
import 'package:e_commerce/domain/repositories/categories_and_brands/brands_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBrandsUseCase {
  final BrandsRepository brandsRepository;

  GetAllBrandsUseCase(this.brandsRepository);

  Future<Either<Failure, CategoriesOrBrandsResponseEntity>> call() async {
    return await brandsRepository.getAllBrands();
  }
}
