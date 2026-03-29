import 'package:e_commerce/domain/entities/categories_or_brands_response_entity.dart';

class ProductResponseEntity {
  num? results;
  ProductMetadataEntity? productMetadataEntity;
  List<ProductEntity>? productEntity;

  ProductResponseEntity({
    this.results,
    this.productMetadataEntity,
    this.productEntity,
  });
}

class ProductMetadataEntity {
  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;

  ProductMetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });
}

class ProductEntity {
  num? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? sId;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoriesOrBrandsResponseEntity? category;
  CategoriesOrBrandsResponseEntity? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  String? id;
  num? priceAfterDiscount;
  List<Null>? availableColors;

  ProductEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.sId,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.priceAfterDiscount,
    this.availableColors,
  });
}

class SubcategoryEntity {
  String? sId;
  String? name;
  String? slug;
  String? category;

  SubcategoryEntity({this.sId, this.name, this.slug, this.category});
}
