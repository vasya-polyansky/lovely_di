/// Generic blueprint exception.
class BaseBlueprintException implements Exception {
  /// Exception message.
  final String message;

  const BaseBlueprintException(this.message);

  @override
  String toString() => 'BaseBlueprintException: $message';
}
