class DependencyException implements Exception {
  final String message;

  const DependencyException(this.message);

  @override
  String toString() => 'DependencyException: $message';
}
