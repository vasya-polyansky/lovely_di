import 'i_base_dependency.dart';
import 'i_container.dart';

abstract class IDependency<T> implements IBaseDependency<T> {
  T createValue(IContainer scope);

  bool shouldUpdateValue(T resolvedValue);
}
