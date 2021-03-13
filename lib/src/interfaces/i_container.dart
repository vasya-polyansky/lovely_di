import '../exceptions/disposing_exception.dart';
import 'i_async_blueprint.dart';
import 'i_blueprint.dart';

/// Container to manage dependencies.
abstract class IContainer {
  /// Resolves a value produced by [blueprint].
  T get<T>(IBlueprint<T> blueprint);

  /// Returns a future which resolves to a value produced by [blueprint].
  Future<T> getAsync<T>(IAsyncBlueprint<T> blueprint);

  /// Disposes [resolvedValue] by [blueprint]'s disposing rule.
  ///
  /// Throws [DisposingException] if something goes wrong.
  Future<void> dispose<T>(IBlueprint<T> blueprint, T resolvedValue);
}
