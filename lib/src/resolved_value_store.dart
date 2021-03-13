import 'interfaces/i_base_blueprint.dart';

class ResolvedValueStore<B extends IBaseBlueprint<V>, V> {
  final Map<B, V> _savedValues = {};

  bool isValueSaved(B blueprint) {
    return _savedValues.containsKey(blueprint);
  }

  void saveValueForBlueprint(
    B blueprint,
    V value,
  ) {
    _savedValues[blueprint] = value;
  }

  V geValueForBlueprint(B blueprint) {
    final entry = _savedValues.entries.singleWhere(
      (entry) => identical(entry.key, blueprint),
    );
    return entry.value;
  }

  void removeBlueprintAndValue(B blueprint) {
    _savedValues.remove(blueprint);
  }
}
