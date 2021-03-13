import '../interfaces/i_base_blueprint.dart';
import '../interfaces/i_async_blueprint.dart';
import '../exceptions/blueprint_exception.dart';
import '../interfaces/i_container.dart';
import '../interfaces/i_blueprint.dart';
import '../resolved_value_store.dart';

class Container implements IContainer {
  final ResolvedValueStore _lastResolvedValues = ResolvedValueStore();

  @override
  T get<T>(IBlueprint<T> blueprint) {
    if (!_lastResolvedValues.isValueSaved(blueprint)) {
      return _createAndSaveValue(blueprint);
    }

    final lastValue = _lastResolvedValues.geValueForBlueprint(blueprint);
    if (blueprint.shouldUpdateValue(lastValue)) {
      return _createAndSaveValue(blueprint);
    }

    return lastValue;
  }

  @override
  Future<T> getAsync<T>(IAsyncBlueprint<T> blueprint) async {
    if (!_lastResolvedValues.isValueSaved(blueprint)) {
      return _createAndSaveValueAsync(blueprint);
    }

    final lastValue = _lastResolvedValues.geValueForBlueprint(blueprint);
    if (await blueprint.shouldUpdateValue(lastValue)) {
      return _createAndSaveValueAsync(blueprint);
    }

    return lastValue;
  }

  @override
  Future<void> dispose<T>(IBaseBlueprint<T> blueprint, T resolvedValue) async {
    if (!_lastResolvedValues.isValueSaved(blueprint)) {
      throw BlueprintException(
        'You are trying to dispose a blueprint before it has been resolved.',
      );
    }

    await blueprint.disposeValue(resolvedValue);
    _lastResolvedValues.removeBlueprintAndValue(blueprint);
  }

  T _createAndSaveValue<T>(IBlueprint<T> blueprint) {
    final value = blueprint.createValue(this);
    _lastResolvedValues.saveValueForBlueprint(blueprint, value);
    return value;
  }

  Future<T> _createAndSaveValueAsync<T>(IAsyncBlueprint<T> blueprint) async {
    final value = await blueprint.createValue(this);
    _lastResolvedValues.saveValueForBlueprint(blueprint, value);
    return value;
  }
}
