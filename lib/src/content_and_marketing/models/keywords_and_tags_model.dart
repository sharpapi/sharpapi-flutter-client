class KeywordsAndTagsModel {
  List<String>? keywords;

  KeywordsAndTagsModel({
    this.keywords,
  });

  factory KeywordsAndTagsModel.fromJson(Map<String, dynamic> json) => KeywordsAndTagsModel(
     keywords: List<String>.from(json['keywords'].map((x) => x)),
  );
}