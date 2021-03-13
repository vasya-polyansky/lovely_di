import 'i_base_blueprint.dart';
import 'i_container.dart';

abstract class IAsyncBlueprint<T> implements IBaseBlueprint<T> {
  Future<T> createValue(IContainer scope);

  Future<bool> shouldUpdateValue(T resolvedValue);
}
