typedef GetInstance<R> = R Function();
typedef GetInstanceAsync<R> = Future<R> Function();
typedef OnDispose<T> = Future<void> Function(T instance);

abstract class IDependency<T> {
  T initInstance();

  bool shouldUpdateInstance(T lastInstance);

  Future<void> disposeInstance(T instance);
}
