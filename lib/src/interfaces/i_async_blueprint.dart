import 'i_base_blueprint.dart';
import 'i_container.dart';

/// Asynchronous blueprint defining how to create,
/// update and dispose a value produced by this blueprint.
abstract class IAsyncBlueprint<T> implements IBaseBlueprint<T> {
  /// Creates a new value of this blueprint.
  /// Used by [IContainer] to initialize or update a value.
  /// [scope] is a current container.
  Future<T> createValue(IContainer scope);

  /// Defines whether a value should be updated.
  /// Used by [IContainer] to make choice whether to keep the old value or create a new one.
  Future<bool> shouldUpdateValue(T resolvedValue);
}
