import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/fialures.dart';
import 'package:e_commerce/domain/entities/categories_or_brands_response_entity.dart';
import 'package:e_commerce/domain/entities/product_response_entity.dart';
import 'package:e_commerce/domain/entities/add_to_card_response_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, CategoriesOrBrandsResponseEntity>> getCategories();
  Future<Either<Failure, CategoriesOrBrandsResponseEntity>> getAllBrands();
  Future<Either<Failure, ProductResponseEntity>> getAllProducts();
  Future<Either<Failure, AddToCardResponseEntity>> addProductToCart(
    String categoryId,
  );
}
