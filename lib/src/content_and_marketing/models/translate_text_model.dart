class TranslateTextModel {
  String? content;
  String? fromLanguage;
  String? toLanguage;

  TranslateTextModel({
    this.content,
    this.fromLanguage,
    this.toLanguage,
  });

  factory TranslateTextModel.fromJson(Map<String, dynamic> json) => TranslateTextModel(
    content: json['content'],
    fromLanguage: json['from_language'],
    toLanguage: json['to_language'],
  );
}