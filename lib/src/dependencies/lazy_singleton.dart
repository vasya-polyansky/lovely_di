import '../../lovely_di.dart';
import '../interfaces/i_dependency.dart';

class LazySingleton<T> implements IDependency<T> {
  final GetInstance<T> _getInstance;
  final OnDispose<T>? onDispose;

  const LazySingleton(
    this._getInstance, {
    this.onDispose,
  });

  @override
  T initInstance(IContainer scope) => _getInstance(scope);

  @override
  bool shouldUpdateInstance(T oldInstance) => false;

  @override
  Future<void> disposeInstance(T instance) async => onDispose?.call(instance);
}
