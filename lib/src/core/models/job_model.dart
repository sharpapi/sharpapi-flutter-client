class JobModel {
  String? type;
  String? id;
  String? status;
  String? result;

  JobModel({
    this.type,
    this.id,
    this.status,
    this.result,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
        type: json['data'] != null ? json['data']['attributes']['type'] : '',
        id: json['data'] != null ? json['data']['id'] : '',
        status: json['data'] != null ? json['data']['attributes']['status'] : '',
        result: json['data'] != null ? json['data']['attributes']['result'] : null,
      );
}