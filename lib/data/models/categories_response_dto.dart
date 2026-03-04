import 'package:e_commerce/domain/entities/categories_response_entity.dart';

class CategoriesResponseDto extends CategoriesResponseEntity {
  int? results;
  Metadata? metadata;
  DataDto? dataDto;

  CategoriesResponseDto(
      {this.results, this.metadata, super.dataEntity, super.message});

  CategoriesResponseDto.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    results = json['results'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      dataEntity = <DataEntity>[];
      json['data'].forEach((v) {
        dataEntity!.add(new DataDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['results'] = this.results;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    if (this.dataDto != null) {
      data['data'] = this.dataDto!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['numberOfPages'] = this.numberOfPages;
    data['limit'] = this.limit;
    return data;
  }
}

class DataDto extends DataEntity {
  String? sId;
  String? slug;
  String? createdAt;
  String? updatedAt;

  DataDto(
      {this.sId,
      this.slug,
      this.createdAt,
      this.updatedAt});

  DataDto.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}