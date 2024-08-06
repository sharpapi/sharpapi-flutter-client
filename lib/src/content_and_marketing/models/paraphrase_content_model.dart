class ParaphraseContentModel {
  String? paraphrase;

  ParaphraseContentModel({
    this.paraphrase,
  });

  factory ParaphraseContentModel.fromJson(Map<String, dynamic> json) => ParaphraseContentModel(
        paraphrase: json['paraphrase'],
      );
}