abstract class IBaseDependency<T> {
  Future<void> disposeValue(T resolvedValue);
}
