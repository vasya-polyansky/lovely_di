import '../interfaces/i_container.dart';
import '../interfaces/i_async_dependency.dart';
import '../interfaces/typedefs.dart';

class AsyncFactory<T> implements IAsyncDependency<T> {
  final CreateInstanceAsync<T> _createInstanceAsync;
  final OnDispose<T>? onDispose;

  const AsyncFactory(
    this._createInstanceAsync, {
    this.onDispose,
  });

  @override
  Future<T> createValue(IContainer scope) => _createInstanceAsync(scope);

  @override
  Future<bool> shouldUpdateValue(T resolvedValue) async => true;

  @override
  Future<void> disposeValue(T resolvedValue) async => onDispose?.call(resolvedValue);
}
