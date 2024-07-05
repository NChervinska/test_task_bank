class ApplicationException implements Exception {
  final String message;

  const ApplicationException(this.message);

  @override
  String toString() => message;
}
