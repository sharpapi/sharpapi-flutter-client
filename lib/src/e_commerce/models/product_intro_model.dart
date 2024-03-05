class ProductIntroModel {
  String? productIntro;

  ProductIntroModel({
    this.productIntro,
  });

  factory ProductIntroModel.fromJson(Map<String, dynamic> json) => ProductIntroModel(
    productIntro: json['product_intro'],
  );
}