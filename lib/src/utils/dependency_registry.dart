import '../interfaces/i_dependency.dart';

class DependencyRegistry {
  final Map<IDependency, dynamic> _instanceMap = {};

  bool isDependencyRegistered(IDependency dependency) {
    return _instanceMap.containsKey(dependency);
  }

  T getInstanceForDependency<T>(IDependency<T> dependency) {
    final entry = _instanceMap.entries.singleWhere(
      (entry) => identical(entry.key, dependency),
    );
    return entry.value;
  }

  void removeInstanceForDependency<T>(IDependency<T> dependency) {
    _instanceMap.remove(dependency);
  }

  void registerInstanceForDependency<T>(
    IDependency<T> dependency,
    T instance,
  ) {
    _instanceMap[dependency] = instance;
  }

  T initAndRegisterInstance<T>(IDependency<T> dependency) {
    final instance = dependency.initInstance();
    registerInstanceForDependency(dependency, instance);
    return instance;
  }
}
