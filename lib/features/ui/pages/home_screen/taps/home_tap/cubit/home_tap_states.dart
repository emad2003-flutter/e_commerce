import 'package:e_commerce/domain/entities/categories_or_brands_response_entity.dart';

abstract class HomeTapStates {}

class InitialState extends HomeTapStates {}

class CategoriesLoading extends HomeTapStates {}

class CategoriesLoaded extends HomeTapStates {
  final CategoriesOrBrandsResponseEntity categoriesOrBrandsResponseEntity;
  CategoriesLoaded(this.categoriesOrBrandsResponseEntity);
}

class CategoriesError extends HomeTapStates {
  final String message;
  CategoriesError(this.message);
}

class BrandsLoading extends HomeTapStates {}

class BrandsLoaded extends HomeTapStates {
  final CategoriesOrBrandsResponseEntity categoriesOrBrandsResponseEntity;
  BrandsLoaded(this.categoriesOrBrandsResponseEntity);
}

class BrandsError extends HomeTapStates {
  final String message;
  BrandsError(this.message);
}
