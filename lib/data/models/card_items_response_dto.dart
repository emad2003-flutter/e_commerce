import 'package:e_commerce/data/models/product_response_dto.dart';
import 'package:e_commerce/domain/entities/add_to_card_response_entity.dart';

class AddToCardResponseDto extends AddToCardResponseEntity {
  String? status;
  String? message;
  CartItemDto? cartItemDto;
  String? statusMsg;

  AddToCardResponseDto({
    this.status,
    this.message,
    super.numOfCartItems,
    super.cartId,
    super.cartItemEntity,
  });

  AddToCardResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    cartItemDto = json['cartItemDto'] != null
        ? new CartItemDto.fromJson(json['cartItemEntity'])
        : null;
  }
}

class CartItemDto extends CartItemEntity {
  List<ProductResponseDto>? productsResponseDto;
  String? createdAt;
  String? updatedAt;

  CartItemDto({
    super.sId,
    super.cartOwner,
    this.productsResponseDto,
    this.createdAt,
    this.updatedAt,
    super.iV,
    super.totalCartPrice,
  });

  CartItemDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['productsResponseDto'] != null) {
      productsResponseDto = <ProductResponseDto>[];
      json['productsResponseDto'].forEach((v) {
        productsResponseDto!.add(new ProductResponseDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}
