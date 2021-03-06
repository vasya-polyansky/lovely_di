import '../exceptions/dependency_exception.dart';
import '../interfaces/i_container.dart';
import '../interfaces/i_dependency.dart';
import '../utils/dependency_registry.dart';

class Container implements IContainer {
  final DependencyRegistry registry = DependencyRegistry();

  @override
  T call<T>(IDependency<T> dependency) {
    if (!registry.isDependencyRegistered(dependency)) {
      return registry.initAndRegisterInstance(dependency);
    }

    final lastInstance = registry.getInstanceForDependency(dependency);
    if (dependency.shouldUpdateInstance(lastInstance)) {
      return registry.initAndRegisterInstance(dependency);
    }

    return lastInstance;
  }

  @override
  Future<void> dispose<T>(IDependency<T> dependency, T instance) async {
    if (!registry.isDependencyRegistered(dependency)) {
      throw DependencyException(
        'You try to dispose a dependency before it has been registered.',
      );
    }

    await dependency.disposeInstance(instance);
    registry.removeInstanceForDependency(dependency);
  }
}
