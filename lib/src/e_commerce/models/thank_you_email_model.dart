class ThankYouEmailModel {
  String? email;

  ThankYouEmailModel({
    this.email,
  });

  factory ThankYouEmailModel.fromJson(Map<String, dynamic> json) => ThankYouEmailModel(
    email: json['email'],
  );
}