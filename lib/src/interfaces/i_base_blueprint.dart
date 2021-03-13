/// Base interface for a dependency blueprint.
abstract class IBaseBlueprint<T> {
  /// Disposes a value produced by this blueprint.
  Future<void> disposeValue(T resolvedValue);
}
