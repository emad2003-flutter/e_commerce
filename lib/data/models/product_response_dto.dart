import 'package:e_commerce/data/models/categories_or_brands_response_dto.dart';
import 'package:e_commerce/domain/entities/product_response_entity.dart';

class ProductResponseDto extends ProductResponseEntity {
  ProductResponseDto({
    super.results,
    super.productMetadataEntity,
    this.statusMsg,
    this.message,
    super.productEntity,
  });

  ProductResponseDto.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    productMetadataEntity = json['metadata'] != null
        ? ProductMetadataDto.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      productEntity = [];
      json['data'].forEach((v) {
        productEntity?.add(ProductDto.fromJson(v));
      });
    }
  }

  String? statusMsg;

  String? message;
}

class ProductDto extends ProductEntity {
  ProductDto({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  ProductDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoriesResponseDto.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? CategoriesResponseDto.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

  String? createdAt;
  String? updatedAt;
}

class SubcategoryDto extends SubcategoryEntity {
  SubcategoryDto({super.sId, super.name, super.slug, super.category});

  SubcategoryDto.fromJson(dynamic json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}

class ProductMetadataDto extends ProductMetadataEntity {
  ProductMetadataDto({
    super.currentPage,
    super.numberOfPages,
    super.limit,
    super.nextPage,
  });

  ProductMetadataDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
}

// import 'package:e_commerce/data/models/categories_or_brands_response_dto.dart';
// import 'package:e_commerce/domain/entities/product_response_entity.dart';

// class ProductResponseDto extends ProductResponseEntity {
//   ProductResponseDto({
//     super.results,
//     super.productMetadataEntity,
//     this.statusMsg,
//     this.message,
//     super.productEntity,
//   });
//   ProductResponseDto.fromJson(Map<String, dynamic> json) {
//     statusMsg = json['statusMsg'];
//     message = json['message'];
//     results = json['results'];
//     productMetadataEntity = json['metadata'] != null
//         ? ProductMetadataDto.fromJson(json['metadata'])
//         : null;
//     if (json['data'] != null) {
//       productEntity = <ProductEntity>[];
//       json['data'].forEach((v) {
//         productEntity!.add(ProductDto.fromJson(v));
//       });
//     }
//   }

//   String? statusMsg;

//   String? message;
// }

// class ProductDto extends ProductEntity {
//   ProductDto({
//     super.sold,
//     super.images,
//     super.subcategory,
//     super.ratingsQuantity,
//     super.id,
//     super.title,
//     super.slug,
//     super.description,
//     super.quantity,
//     super.price,
//     super.imageCover,
//     super.category,
//     super.brand,
//     super.ratingsAverage,
//     super.createdAt,
//     super.updatedAt,
//   });

//   ProductDto.fromJson(dynamic json) {
//     sold = json['sold'];
//     images = json['images'] != null ? json['images'].cast<String>() : [];
//     if (json['subcategory'] != null) {
//       subcategory = [];
//       json['subcategory'].forEach((v) {
//         subcategory?.add(SubcategoryDto.fromJson(v));
//       });
//     }
//     ratingsQuantity = json['ratingsQuantity'];
//     id = json['_id'];
//     title = json['title'];
//     slug = json['slug'];
//     description = json['description'];
//     quantity = json['quantity'];
//     price = json['price'];
//     imageCover = json['imageCover'];
//     category = json['category'] != null
//         ? CategoriesResponseDto.fromJson(json['category'])
//         : null;
//     brand = json['brand'] != null
//         ? CategoriesResponseDto.fromJson(json['brand'])
//         : null;
//     ratingsAverage = json['ratingsAverage'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     id = json['id'];
//   }
// }

// class SubcategoryDto extends SubcategoryEntity {
//   SubcategoryDto({super.sId, super.name, super.slug, super.category});

//   SubcategoryDto.fromJson(dynamic json) {
//     sId = json['_id'];
//     name = json['name'];
//     slug = json['slug'];
//     category = json['category'];
//   }
// }

// class ProductMetadataDto extends ProductMetadataEntity {
//   ProductMetadataDto({
//     super.currentPage,
//     super.numberOfPages,
//     super.limit,
//     super.nextPage,
//   });

//   ProductMetadataDto.fromJson(dynamic json) {
//     currentPage = json['currentPage'];
//     numberOfPages = json['numberOfPages'];
//     limit = json['limit'];
//     nextPage = json['nextPage'];
//   }
// }
