import 'i_container.dart';

typedef CreateInstance<R> = R Function(IContainer scope);
typedef CreateInstanceAsync<R> = Future<R> Function(IContainer scope);
typedef OnDispose<T> = Future<void> Function(T instance);
