import '../../lovely_di.dart';
import '../interfaces/i_dependency.dart';

class Factory<T> implements IDependency<T> {
  final GetInstance<T> _getInstance;
  final OnDispose<T>? onDispose;

  const Factory(
    this._getInstance, {
    this.onDispose,
  });

  @override
  T initInstance(IContainer scope) => _getInstance(scope);

  @override
  bool shouldUpdateInstance(T oldInstance) => true;

  @override
  Future<void> disposeInstance(T instance) async => onDispose?.call(instance);
}
