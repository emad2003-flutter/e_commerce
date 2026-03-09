import 'package:e_commerce/domain/entities/categories_or_brands_response_entity.dart';

class CategoriesResponseDto extends CategoriesOrBrandsResponseEntity {
  @override
  int? results;
  Metadata? metadata;
  DataDto? dataDto;

  CategoriesResponseDto({
    this.results,
    this.metadata,
    super.dataEntity,
    super.message,
  });

  CategoriesResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    results = json['results'];
    metadata = json['metadata'] != null
        ? Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      dataEntity = <DataEntity>[];
      json['data'].forEach((v) {
        dataEntity!.add(DataDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['results'] = results;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    if (dataDto != null) {
      data['data'] = dataDto!.toJson();
    }
    return data;
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['numberOfPages'] = numberOfPages;
    data['limit'] = limit;
    return data;
  }
}

class DataDto extends DataEntity {
  String? sId;
  String? slug;
  String? createdAt;
  String? updatedAt;

  DataDto({this.sId, this.slug, this.createdAt, this.updatedAt});

  DataDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
