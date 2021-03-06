import '../interfaces/i_dependency.dart';
import '../utils/converters.dart';

class Factory<T> implements IDependency<T> {
  final GetInstance<T> _getInstance;
  final OnDispose<T>? onDispose;

  const Factory(
    this._getInstance, {
    this.onDispose,
  });

  @override
  T initInstance() => _getInstance();

  @override
  bool shouldUpdateInstance(T oldInstance) => true;

  @override
  Future<void> disposeInstance(T instance) {
    return onDisposeToDisposeInstance(
      instance: instance,
      onDispose: onDispose,
    );
  }
}
