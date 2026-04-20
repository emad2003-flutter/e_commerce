import 'package:e_commerce/domain/entities/product_response_entity.dart';

abstract class ProductsStates {}

class ProductsInitialState extends ProductsStates {}

class ProductsLoadingState extends ProductsStates {}

class ProductsLoadedState extends ProductsStates {
  final ProductResponseEntity productResponseEntity;
  ProductsLoadedState(this.productResponseEntity);
}

class ProductsErrorState extends ProductsStates {
  final String message;
  ProductsErrorState(this.message);
}
