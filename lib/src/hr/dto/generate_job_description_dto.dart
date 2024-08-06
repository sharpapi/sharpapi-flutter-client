class GenerateJobDescriptionDto {
  final String name;
  String? companyName;
  String? minimumEducation;
  String? minimumWorkExperience;
  String? employmentType;
  String? country;
  bool? remote;
  bool? visaSponsored;
  List<String>? requiredSkills;
  List<String>? optionalSkills;
  String language;
  String? voiceTone;
  String? context;

  GenerateJobDescriptionDto({
    required this.name,
    this.companyName,
    this.minimumEducation,
    this.minimumWorkExperience,
    this.employmentType,
    this.country,
    this.remote,
    this.visaSponsored,
    this.requiredSkills,
    this.optionalSkills,
    this.language = 'English',
    this.voiceTone,
    this.context,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    if(companyName != null) 'company_name': companyName,
    if(minimumEducation != null) 'minimum_education': minimumEducation,
    if(minimumWorkExperience != null) 'minimum_work_experience': minimumWorkExperience,
    if(employmentType != null) 'employment_type': employmentType,
    if(country != null) 'country': country,
    if(remote != null) 'remote': remote,
    if(visaSponsored != null) 'visa_sponsored': visaSponsored,
    if(requiredSkills != null) 'required_skills': requiredSkills,
    if(optionalSkills != null) 'optional_skills': optionalSkills,
    'language': language,
    if(voiceTone != null) 'voice_tone': voiceTone,
    if(context != null) 'context': context,
  };
}