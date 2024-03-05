class PhoneNumberModel {
  String? parsedNumber;
  String? detectedNumber;

  PhoneNumberModel({
    this.parsedNumber,
    this.detectedNumber,
  });

  factory PhoneNumberModel.fromJson(Map<String, dynamic> json) => PhoneNumberModel(
    parsedNumber: json['parsed_number'],
    detectedNumber: json['detected_number'],
  );
}