import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/data/data_souces/remote/brands_remote_data_source.dart';
import 'package:e_commerce/domain/entities/categories_or_brands_response_entity.dart';
import 'package:e_commerce/domain/repositories/categories_and_brands/brands_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepository)
class BrandsRepositoryImpl implements BrandsRepository {
  BrandsRepositoryImpl({required this.brandsRemoteDataSource});
  BrandsRemoteDataSource brandsRemoteDataSource;
  @override
  Future<Either<Failure, CategoriesOrBrandsResponseEntity>> getAllBrands() {
    return brandsRemoteDataSource.getAllBrands();
  }
}
