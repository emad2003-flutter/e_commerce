import 'package:e_commerce/domain/entities/categories_response_entity.dart';

abstract class HomeTapStates {}

class InitialState extends HomeTapStates {}

class CategoriesLoading extends HomeTapStates {}

class CategoriesLoaded extends HomeTapStates {
  final CategoriesResponseEntity categoriesResponseEntity;
  CategoriesLoaded(this.categoriesResponseEntity);
}

class CategoriesError extends HomeTapStates {
  final String message;
  CategoriesError(this.message);
}
