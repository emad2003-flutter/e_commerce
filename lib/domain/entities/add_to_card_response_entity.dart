import 'package:e_commerce/domain/entities/product_response_entity.dart';

class AddToCardResponseEntity {
  int? numOfCartItems;
  String? cartId;
  CartItemEntity? cartItemEntity;

  AddToCardResponseEntity({
    this.numOfCartItems,
    this.cartId,
    this.cartItemEntity,
  });
}

class CartItemEntity {
  String? sId;
  String? cartOwner;
  List<ProductEntity>? products;
  int? iV;
  int? totalCartPrice;

  CartItemEntity({
    this.sId,
    this.cartOwner,
    this.products,
    this.iV,
    this.totalCartPrice,
  });
}
