import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/data/data_souces/remote/home_remote_data_source.dart';
import 'package:e_commerce/domain/entities/categories_or_brands_response_entity.dart';
import 'package:e_commerce/domain/entities/product_response_entity.dart';
import 'package:e_commerce/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, CategoriesOrBrandsResponseEntity>> getCategories() {
    return homeRemoteDataSource.getCategories();
  }

  @override
  Future<Either<Failure, CategoriesOrBrandsResponseEntity>> getAllBrands() {
    return homeRemoteDataSource.getAllBrands();
  }

  @override
  Future<Either<Failure, ProductResponseEntity>> getAllProducts() {
    return homeRemoteDataSource.getAllProducts();
  }
}
