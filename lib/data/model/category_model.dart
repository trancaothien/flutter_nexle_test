class CategoryModel {
  CategoryModel({this.id, this.name});
  String? id;
  String? name;

  CategoryModel.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
  }
}

class CategoriesModel {
  CategoriesModel({this.totalCount, this.categories});
  int? totalCount;
  List<CategoryModel>? categories;

  CategoriesModel.fromJson(dynamic json) {
    totalCount = json['totalCount'];
    categories = json['categories'] != null
        ? List<CategoryModel>.from(
            json['categories'].map((model) => CategoryModel.fromJson(model)),
          )
        : [];
  }
}
