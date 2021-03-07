import 'package:lovely_di/lovely_di.dart';

typedef GetInstance<R> = R Function(IContainer scope);
typedef GetInstanceAsync<R> = Future<R> Function(IContainer scope);
typedef OnDispose<T> = Future<void> Function(T instance);

abstract class IDependency<T> {
  T initInstance(IContainer scope);

  bool shouldUpdateInstance(T lastInstance);

  Future<void> disposeInstance(T instance);
}
