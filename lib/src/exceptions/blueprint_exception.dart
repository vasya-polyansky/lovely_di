class BlueprintException implements Exception {
  final String message;

  const BlueprintException(this.message);

  @override
  String toString() => 'BlueprintException: $message';
}
