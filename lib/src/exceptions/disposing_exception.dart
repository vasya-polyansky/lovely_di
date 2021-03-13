import 'base_blueprint_exception.dart';

/// Exception which is thrown from container if something goes wrong during disposing.
class DisposingException implements BaseBlueprintException {
  @override
  final String message;

  const DisposingException(this.message);

  @override
  String toString() => 'DisposingException: $message';
}
