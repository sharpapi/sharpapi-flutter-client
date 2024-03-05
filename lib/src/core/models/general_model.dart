class GeneralModel {
  final String? statusUrl;

  GeneralModel({
    this.statusUrl,
  });

  factory GeneralModel.fromJson(Map<String, dynamic> json) => GeneralModel(
        statusUrl: json['status_url'],
      );
}