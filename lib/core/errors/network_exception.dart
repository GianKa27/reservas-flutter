class NetworkException implements Exception {
  final dynamic message;

  NetworkException(this.message);

  @override
  String toString() {
    return message.toString();
  }
}
