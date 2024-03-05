class GenerateJobDescriptionModel {
  String? jobShortDescription;
  String? jobRequirements;
  String? jobResponsibilities;

  GenerateJobDescriptionModel({
    this.jobShortDescription,
    this.jobRequirements,
    this.jobResponsibilities,
  });

  factory GenerateJobDescriptionModel.fromJson(Map<String, dynamic> json) => GenerateJobDescriptionModel(
        jobShortDescription: json['job_short_description'],
        jobRequirements: json['job_requirements'],
        jobResponsibilities: json['job_responsibilities'],
      );
}