import 'i_async_blueprint.dart';
import 'i_blueprint.dart';

abstract class IContainer {
  T get<T>(IBlueprint<T> blueprint);

  Future<T> getAsync<T>(IAsyncBlueprint<T> blueprint);

  Future<void> dispose<T>(IBlueprint<T> blueprint, T resolvedValue);
}
