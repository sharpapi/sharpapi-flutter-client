import 'di/injection.dart';

/// Class to hold the configurations of the SharpApi Flutter Client
class SharpApiConfigs {
  SharpApiConfigs._();

  /// The api key of the SharpApi Flutter Client
  static String _apiKey = '';

  /// how many seconds the client should wait between each result request
  /// usually default 10s, this value won't have an effect unless [_apiJobStatusPollingInterval] changed
  static double _apiJobStatusPollingInterval = 5;

  /// how long (in seconds) the client should wait in polling mode for results, default 180s
  static double _apiJobStatusPollingWait = 180;

  /// Initialize the SharpApiConfigs with the given [apiKey]
  static void init({
    required String apiKey,
    double apiJobStatusPollingInterval = 5,
    double apiJobStatusPollingWait = 180,
  }) async {
    SharpApiConfigs._apiKey = apiKey;
    SharpApiConfigs._apiJobStatusPollingInterval = apiJobStatusPollingInterval;
    SharpApiConfigs._apiJobStatusPollingWait = apiJobStatusPollingWait;
    await initDi();
  }

  /// Get the api key of the SharpApi Flutter Client
  static String get apiKey => _apiKey;

  /// Get the api job status polling interval
  static double get apiJobStatusPollingInterval => _apiJobStatusPollingInterval;

  /// Get the api job status polling wait time
  static double get apiJobStatusPollingWait => _apiJobStatusPollingWait;
}
