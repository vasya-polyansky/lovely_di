import '../interfaces/i_container.dart';
import '../interfaces/i_async_blueprint.dart';
import '../interfaces/typedefs.dart';

/// Asynchronous factory blueprint.
/// Its value is asynchronously created each time [IContainer.getAsync] is called.
class AsyncFactory<T> implements IAsyncBlueprint<T> {
  /// Asynchronously creates a new value.
  final CreateInstanceAsync<T> createInstanceAsync;
  /// Disposes a value.
  final OnDispose<T>? onDispose;

  const AsyncFactory(
    this.createInstanceAsync, {
    this.onDispose,
  });

  @override
  Future<T> createValue(IContainer scope) => createInstanceAsync(scope);

  @override
  Future<bool> shouldUpdateValue(T resolvedValue) async => true;

  @override
  Future<void> disposeValue(T resolvedValue) async => onDispose?.call(resolvedValue);
}
