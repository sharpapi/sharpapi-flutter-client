import 'package:sharpapi_flutter_client/src/core/models/category_model.dart';

class CategoriesModel {
  List<CategoryModel>? categories;

  CategoriesModel({
    this.categories,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    categories: List<CategoryModel>.from(json['categories'].map((x) => CategoryModel.fromJson(x))),
  );
}