import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/data/data_souces/remote/categories_remote_data_source.dart';
import 'package:e_commerce/domain/entities/categories_or_brands_response_entity.dart';
import 'package:e_commerce/domain/repositories/categories_and_brands/categories_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl extends CategoriesRepository {
  CategoriesRepositoryImpl({required this.categoriesRemoteDataSource});
  CategoriesRemoteDataSource categoriesRemoteDataSource;

  @override
  Future<Either<Failure, CategoriesOrBrandsResponseEntity>> getCategories() {
    return categoriesRemoteDataSource.getCategories();
  }
}
