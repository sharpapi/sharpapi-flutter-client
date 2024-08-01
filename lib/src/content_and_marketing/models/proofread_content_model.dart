class ProofreadContentModel {
  String? proofread;

  ProofreadContentModel({
    this.proofread,
  });

  factory ProofreadContentModel.fromJson(Map<String, dynamic> json) => ProofreadContentModel(
    proofread: json['proofread'],
  );
}