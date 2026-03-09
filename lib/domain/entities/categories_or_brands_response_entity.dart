class CategoriesOrBrandsResponseEntity {
  int? results;
  String? message;
  List<DataEntity>? dataEntity;
  CategoriesOrBrandsResponseEntity({
    this.results,
    this.dataEntity,
    this.message,
  });
}

class DataEntity {
  String? name;
  String? image;

  DataEntity({this.name, this.image});
}
