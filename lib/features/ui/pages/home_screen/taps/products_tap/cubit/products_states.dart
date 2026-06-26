import 'package:e_commerce/domain/entities/add_to_card_response_entity.dart';
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

class AddToCardLoadingState extends ProductsStates {}

class AddToCardLoadedState extends ProductsStates {
  final AddToCardResponseEntity addResponseEntity;
  AddToCardLoadedState(this.addResponseEntity);
}

class AddToCardErrorState extends ProductsStates {
  final String message;
  AddToCardErrorState(this.message);
}
