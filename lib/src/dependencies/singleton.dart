import '../interfaces/i_dependency.dart';
import '../utils/converters.dart';

class Singleton<T> implements IDependency<T> {
  final T _instance;
  final OnDispose<T>? onDispose;

  const Singleton(
    this._instance, {
    this.onDispose,
  });

  @override
  T initInstance() => _instance;

  @override
  bool shouldUpdateInstance(T oldInstance) => false;

  @override
  Future<void> disposeInstance(T instance) {
    return onDisposeToDisposeInstance(
      instance: instance,
      onDispose: onDispose,
    );
  }
}
