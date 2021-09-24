import '../interfaces/typedefs.dart';
import '../interfaces/i_container.dart';
import 'factory.dart';

/// Lazy singleton blueprint.
/// Its value is created the first time [IContainer.get] is called and then reused.
class LazySingleton<T> extends Factory<T> {
  const LazySingleton(
    /// Creates a new value.
    CreateInstance<T> createInstance, {

    /// Disposes a value.
    OnDispose<T>? onDispose,
  }) : super(
          createInstance,
          onDispose: onDispose,
        );

  @override
  bool shouldUpdateValue(T oldInstance) => false;
}
