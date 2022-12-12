class ServerException implements Exception {}

class DataBaseDb implements Exception {
  final String message;

  DataBaseDb(this.message);
}
