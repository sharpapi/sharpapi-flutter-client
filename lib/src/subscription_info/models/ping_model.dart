class PingModel {
  String? ping;
  String? timestamp;

  PingModel({
    this.ping,
    this.timestamp,
  });

  factory PingModel.fromJson(Map<String, dynamic> json) => PingModel(
    ping: json['ping'],
    timestamp: json['timestamp'],
  );
}