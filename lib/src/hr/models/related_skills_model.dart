class RelatedSkillsModel {
  String? skill;
  List<SkillModel>? relatedSkills;

  RelatedSkillsModel({
    this.skill,
    this.relatedSkills,
  });

  factory RelatedSkillsModel.fromJson(Map<String, dynamic> json) => RelatedSkillsModel(
        skill: json['skill'],
        relatedSkills: List<SkillModel>.from(json['related_skills'].map((x) => SkillModel.fromJson(x))),
      );
}

class SkillModel {
  String? name;
  num? weight;

  SkillModel({
    this.name,
    this.weight,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        name: json['name'],
        weight: json['weight'],
      );
}
