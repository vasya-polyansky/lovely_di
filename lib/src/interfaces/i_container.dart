import 'i_dependency.dart';

abstract class IContainer {
  T get<T>(IDependency<T> dependency);

  /// This is just an alternative to [IContainer.get] method.
  T call<T>(IDependency<T> dependency);

  Future<void> dispose<T>(IDependency<T> dependency, T instance);
}
