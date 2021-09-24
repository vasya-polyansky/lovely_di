import '../interfaces/typedefs.dart';
import '../interfaces/i_container.dart';
import 'async_factory.dart';

/// Async lazy singleton blueprint.
/// Its value is asynchronously created the first time [IContainer.getAsync] is called and then reused.
class AsyncLazySingleton<T> extends AsyncFactory<T> {
  const AsyncLazySingleton(
    /// Asynchronously creates a new value.
    CreateInstanceAsync<T> createInstanceAsync, {

    /// Disposes a value.
    OnDispose<T>? onDispose,
  }) : super(
          createInstanceAsync,
          onDispose: onDispose,
        );

  @override
  Future<bool> shouldUpdateValue(T resolvedValue) async => false;
}
