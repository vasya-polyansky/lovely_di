import 'interfaces/i_dependency.dart';

class InstanceStore {
  final Map<IDependency, dynamic> _savedInstances = {};

  bool isInstanceSaved(IDependency dependency) {
    return _savedInstances.containsKey(dependency);
  }

  void saveInstanceForDependency<T>(
    IDependency<T> dependency,
    T instance,
  ) {
    _savedInstances[dependency] = instance;
  }

  T getInstanceForDependency<T>(IDependency<T> dependency) {
    final entry = _savedInstances.entries.singleWhere(
      (entry) => identical(entry.key, dependency),
    );
    return entry.value;
  }

  void removeInstanceForDependency<T>(IDependency<T> dependency) {
    _savedInstances.remove(dependency);
  }
}
