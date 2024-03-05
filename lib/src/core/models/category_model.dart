class CategoryModel {
  String? name;
  num? weight;

  CategoryModel({
    this.name,
    this.weight,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    name: json['name'],
    weight: json['weight'],
  );
}