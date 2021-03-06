import '../interfaces/i_dependency.dart';

Future<void> onDisposeToDisposeInstance<T>({
  required T instance,
  OnDispose<T>? onDispose,
}) async {
  if (onDispose != null) {
    return onDispose(instance);
  }
}
