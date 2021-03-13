import '../interfaces/i_container.dart';
import '../interfaces/typedefs.dart';
import '../interfaces/i_blueprint.dart';

class Factory<T> implements IBlueprint<T> {
  final CreateInstance<T> _createInstance;
  final OnDispose<T>? onDispose;

  const Factory(
    this._createInstance, {
    this.onDispose,
  });

  @override
  T createValue(IContainer scope) => _createInstance(scope);

  @override
  bool shouldUpdateValue(T oldInstance) => true;

  @override
  Future<void> disposeValue(T instance) async => onDispose?.call(instance);
}
