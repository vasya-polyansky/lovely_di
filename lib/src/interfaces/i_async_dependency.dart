import 'i_base_dependency.dart';
import 'i_container.dart';

abstract class IAsyncDependency<T> implements IBaseDependency<T> {
  Future<T> createValue(IContainer scope);

  Future<bool> shouldUpdateValue(T resolvedValue);
}
