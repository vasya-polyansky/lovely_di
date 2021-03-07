import '../exceptions/dependency_exception.dart';
import '../interfaces/i_container.dart';
import '../interfaces/i_dependency.dart';
import '../instance_store.dart';

class Container implements IContainer {
  final InstanceStore _lastInstances = InstanceStore();

  @override
  T get<T>(IDependency<T> dependency) {
    if (!_lastInstances.isInstanceSaved(dependency)) {
      return _initAndSaveInstance(dependency);
    }

    final lastInstance = _lastInstances.getInstanceForDependency(dependency);
    if (dependency.shouldUpdateInstance(lastInstance)) {
      return _initAndSaveInstance(dependency);
    }

    return lastInstance;
  }

  @override
  T call<T>(IDependency<T> dependency) => get(dependency);

  @override
  Future<void> dispose<T>(IDependency<T> dependency, T instance) async {
    if (!_lastInstances.isInstanceSaved(dependency)) {
      throw DependencyException(
        'You try to dispose a dependency before it has been registered.',
      );
    }

    await dependency.disposeInstance(instance);
    _lastInstances.removeInstanceForDependency(dependency);
  }

  T _initAndSaveInstance<T>(IDependency<T> dependency) {
    final instance = dependency.initInstance(this);
    _lastInstances.saveInstanceForDependency(dependency, instance);
    return instance;
  }
}
