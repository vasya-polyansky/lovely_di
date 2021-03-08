import '../interfaces/typedefs.dart';
import 'factory.dart';

class LazySingleton<T> extends Factory<T> {
  const LazySingleton(
    CreateInstance<T> createInstance, {
    OnDispose<T>? onDispose,
  }) : super(
          createInstance,
          onDispose: onDispose,
        );

  @override
  bool shouldUpdateValue(T oldInstance) => false;
}
