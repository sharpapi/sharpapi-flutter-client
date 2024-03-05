class DetectSpamModel {
  bool? pass;
  num? score;
  String? reason;

  DetectSpamModel({
    this.pass,
    this.score,
    this.reason,
  });

  factory DetectSpamModel.fromJson(Map<String, dynamic> json) => DetectSpamModel(
    pass: json['pass'],
    score: json['score'],
    reason: json['reason'],
  );
}