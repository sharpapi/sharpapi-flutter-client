class GeneralModel {
  final String? statusUrl;
  final String? jobId;

  GeneralModel({
    this.statusUrl,
    this.jobId,
  });

  factory GeneralModel.fromJson(Map<String, dynamic> json) => GeneralModel(
        statusUrl: json['status_url'],
        jobId: json['job_id'],
      );
}