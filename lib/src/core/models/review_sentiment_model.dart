class ReviewSentimentModel {
  num? score;
  String? opinion;

  ReviewSentimentModel({
    this.score,
    this.opinion,
  });

  factory ReviewSentimentModel.fromJson(Map<String, dynamic> json) => ReviewSentimentModel(
    score: json['score'],
    opinion: json['opinion'],
  );
}