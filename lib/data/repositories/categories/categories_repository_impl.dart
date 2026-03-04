import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/data/data_souces/remote/categories_remote_data_source.dart';
import 'package:e_commerce/domain/entities/categories_response_entity.dart';
import 'package:e_commerce/domain/repositories/categories/categories_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl extends CategoriesRepository {
  CategoriesRepositoryImpl({required this.categoriesRemoteDataSource});
  CategoriesRemoteDataSource categoriesRemoteDataSource;

  @override
  Future<Either<Failure, CategoriesResponseEntity>> getCategories() {
    return categoriesRemoteDataSource.getCategories();
  }
}
