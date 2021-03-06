import 'i_dependency.dart';

abstract class IContainer {
  T call<T>(IDependency<T> dependency);

  Future<void> dispose<T>(IDependency<T> dependency, T instance);
}
