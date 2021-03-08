import 'interfaces/i_base_dependency.dart';

class ResolvedValueStore<D extends IBaseDependency<V>, V> {
  final Map<D, V> _savedValues = {};

  bool isValueSaved(D dependency) {
    return _savedValues.containsKey(dependency);
  }

  void saveValueForDependency(
    D dependency,
    V value,
  ) {
    _savedValues[dependency] = value;
  }

  V geValueForDependency(D dependency) {
    final entry = _savedValues.entries.singleWhere(
      (entry) => identical(entry.key, dependency),
    );
    return entry.value;
  }

  void removeValueForDependency(D dependency) {
    _savedValues.remove(dependency);
  }
}
