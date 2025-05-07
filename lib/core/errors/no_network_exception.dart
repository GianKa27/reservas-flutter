class NoNetworkException implements Exception {
  final String message = "No tienes conexión a internet";

  @override
  String toString() {
    return message;
  }
}
