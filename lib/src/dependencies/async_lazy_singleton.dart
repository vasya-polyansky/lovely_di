import '../interfaces/typedefs.dart';
import 'async_factory.dart';

class AsyncLazySingleton<T> extends AsyncFactory<T> {
  const AsyncLazySingleton(
    CreateInstanceAsync<T> createInstanceAsync, {
    OnDispose<T>? onDispose,
  }) : super(
          createInstanceAsync,
          onDispose: onDispose,
        );

  @override
  Future<bool> shouldUpdateValue(T resolvedValue) async => false;
}
