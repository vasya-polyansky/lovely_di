import '../interfaces/i_container.dart';
import '../interfaces/typedefs.dart';
import '../interfaces/i_blueprint.dart';

/// Factory blueprint.
/// Its value will be created each time [IContainer.get] is called.
class Factory<T> implements IBlueprint<T> {
  /// Creates a new value.
  final CreateInstance<T> createInstance;

  /// Disposes a value.
  final OnDispose<T>? onDispose;

  const Factory(
    this.createInstance, {
    this.onDispose,
  });

  @override
  T createValue(IContainer scope) => createInstance(scope);

  @override
  bool shouldUpdateValue(T oldInstance) => true;

  @override
  Future<void> disposeValue(T instance) async => onDispose?.call(instance);
}
