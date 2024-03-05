class SummarizeContentModel {
  String? summary;

  SummarizeContentModel({
    this.summary,
  });

  factory SummarizeContentModel.fromJson(Map<String, dynamic> json) => SummarizeContentModel(
    summary: json['summary'],
  );
}