import 'i_base_blueprint.dart';
import 'i_container.dart';

abstract class IBlueprint<T> implements IBaseBlueprint<T> {
  T createValue(IContainer scope);

  bool shouldUpdateValue(T resolvedValue);
}
