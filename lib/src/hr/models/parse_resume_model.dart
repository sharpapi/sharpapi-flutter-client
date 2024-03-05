class ParseResumeModel {
  String? candidateName;
  String? candidateEmail;
  String? candidatePhone;
  String? candidateAddress;
  String? candidateLanguage;
  List<String>? candidateSpokenLanguages;
  List<String>? candidateHonorsAndAwards;
  List<String>? candidateCoursesAndCertifications;
  List<CandidatePositionsModel>? positions;
  List<CandidateEducationModel>? educationQualifications;

  ParseResumeModel({
    this.candidateName,
    this.candidateEmail,
    this.candidatePhone,
    this.candidateAddress,
    this.candidateLanguage,
    this.candidateSpokenLanguages,
    this.candidateHonorsAndAwards,
    this.candidateCoursesAndCertifications,
    this.positions,
    this.educationQualifications,
  });

  factory ParseResumeModel.fromJson(Map<String, dynamic> json) => ParseResumeModel(
        candidateName: json['candidate_name'],
        candidateEmail: json['candidate_email'],
        candidatePhone: json['candidate_phone'],
        candidateAddress: json['candidate_address'],
        candidateLanguage: json['candidate_language'],
        candidateSpokenLanguages: List<String>.from(json['candidate_spoken_languages'].map((x) => x)),
        candidateHonorsAndAwards: List<String>.from(json['candidate_honors_and_awards'].map((x) => x)),
        candidateCoursesAndCertifications: List<String>.from(json['candidate_courses_and_certifications'].map((x) => x)),
        positions: List<CandidatePositionsModel>.from(json['positions'].map((x) => CandidatePositionsModel.fromJson(x))),
        educationQualifications: List<CandidateEducationModel>.from(json['education_qualifications'].map((x) => CandidateEducationModel.fromJson(x))),
      );
}

class CandidatePositionsModel {
  List<String>? skills;
  String? country;
  String? endDate;
  String? startDate;
  String? jobDetails;
  String? companyName;
  String? positionName;

  CandidatePositionsModel({
    this.skills,
    this.country,
    this.endDate,
    this.startDate,
    this.jobDetails,
    this.companyName,
    this.positionName,
  });

  factory CandidatePositionsModel.fromJson(Map<String, dynamic> json) => CandidatePositionsModel(
        skills: List<String>.from(json['skills'].map((x) => x)),
        country: json['country'],
        endDate: json['end_date'],
        startDate: json['start_date'],
        jobDetails: json['job_details'],
        companyName: json['company_name'],
        positionName: json['position_name'],
      );
}

class CandidateEducationModel {
  String? country;
  String? endDate;
  String? startDate;
  String? degreeType;
  String? schoolName;
  String? schoolType;
  String? learningMode;
  String? educationDetails;
  String? facultyDepartment;
  String? specializationSubjects;

  CandidateEducationModel({
    this.country,
    this.endDate,
    this.startDate,
    this.degreeType,
    this.schoolName,
    this.schoolType,
    this.learningMode,
    this.educationDetails,
    this.facultyDepartment,
    this.specializationSubjects,
  });

  factory CandidateEducationModel.fromJson(Map<String, dynamic> json) => CandidateEducationModel(
        country: json['country'],
        endDate: json['end_date'],
        startDate: json['start_date'],
        degreeType: json['degree_type'],
        schoolName: json['school_name'],
        schoolType: json['school_type'],
        learningMode: json['learning_mode'],
        educationDetails: json['education_details'],
        facultyDepartment: json['faculty_department'],
        specializationSubjects: json['specialization_subjects'],
      );
}
