class RelatedJobPositionModel {
  String? jobPosition;
  List<JobModel>? relatedJobPosition;

  RelatedJobPositionModel({
    this.jobPosition,
    this.relatedJobPosition,
  });

  factory RelatedJobPositionModel.fromJson(Map<String, dynamic> json) => RelatedJobPositionModel(
        jobPosition: json['job_position'],
        relatedJobPosition: List<JobModel>.from(json['related_job_positions'].map((x) => JobModel.fromJson(x))),
      );
}

class JobModel {
  String? name;
  num? weight;

  JobModel({
    this.name,
    this.weight,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        name: json['name'],
        weight: json['weight'],
      );
}
