import '../interfaces/i_dependency.dart';
import '../utils/converters.dart';

class LazySingleton<T> implements IDependency<T> {
  final GetInstance<T> _getInstance;
  final OnDispose<T>? onDispose;

  const LazySingleton(
    this._getInstance, {
    this.onDispose,
  });

  @override
  T initInstance() => _getInstance();

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
