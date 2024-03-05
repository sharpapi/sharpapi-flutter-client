class ServerException implements Exception {
  final int code;
  final String message;

  ServerException({
    required this.code,
    required this.message,
  });
}

class CacheException implements Exception {
  final dynamic error;

  CacheException(this.error);
}

class SharpApiException implements Exception {
  final String message;

  SharpApiException(this.message);
}