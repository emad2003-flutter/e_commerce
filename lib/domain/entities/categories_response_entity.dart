class CategoriesResponseEntity {
  int? results;
  String? message;
  List<DataEntity>? dataEntity;
  CategoriesResponseEntity({this.results, this.dataEntity, this.message});
}

class DataEntity {
  String? name;
  String? image;

  DataEntity({this.name, this.image});
}
