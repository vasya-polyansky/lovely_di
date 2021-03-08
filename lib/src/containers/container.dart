import 'package:lovely_di/src/interfaces/i_base_dependency.dart';

import '../interfaces/i_async_dependency.dart';
import '../exceptions/dependency_exception.dart';
import '../interfaces/i_container.dart';
import '../interfaces/i_dependency.dart';
import '../instance_store.dart';

class Container implements IContainer {
  final ResolvedValueStore _lastResolvedValues = ResolvedValueStore();

  @override
  T get<T>(IDependency<T> dependency) {
    if (!_lastResolvedValues.isValueSaved(dependency)) {
      return _createAndSaveValue(dependency);
    }

    final lastValue = _lastResolvedValues.geValueForDependency(dependency);
    if (dependency.shouldUpdateValue(lastValue)) {
      return _createAndSaveValue(dependency);
    }

    return lastValue;
  }

  @override
  Future<T> getAsync<T>(IAsyncDependency<T> dependency) async {
    if (!_lastResolvedValues.isValueSaved(dependency)) {
      return _createAndSaveValueAsync(dependency);
    }

    final lastValue = _lastResolvedValues.geValueForDependency(dependency);
    if (await dependency.shouldUpdateValue(lastValue)) {
      return _createAndSaveValueAsync(dependency);
    }

    return lastValue;
  }

  @override
  Future<void> dispose<T>(IBaseDependency<T> dependency, T resolvedValue) async {
    if (!_lastResolvedValues.isValueSaved(dependency)) {
      throw DependencyException(
        'You are trying to dispose a dependency before it has been resolved.',
      );
    }

    await dependency.disposeValue(resolvedValue);
    _lastResolvedValues.removeValueForDependency(dependency);
  }

  T _createAndSaveValue<T>(IDependency<T> dependency) {
    final value = dependency.createValue(this);
    _lastResolvedValues.saveValueForDependency(dependency, value);
    return value;
  }

  Future<T> _createAndSaveValueAsync<T>(IAsyncDependency<T> dependency) async {
    final value = await dependency.createValue(this);
    _lastResolvedValues.saveValueForDependency(dependency, value);
    return value;
  }
}
