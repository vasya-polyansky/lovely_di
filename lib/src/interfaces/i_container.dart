import 'i_async_dependency.dart';
import 'i_dependency.dart';

abstract class IContainer {
  T get<T>(IDependency<T> dependency);

  Future<T> getAsync<T>(IAsyncDependency<T> dependency);

  Future<void> dispose<T>(IDependency<T> dependency, T resolvedValue);
}
