import 'package:lovely_di/lovely_di.dart';

abstract class IRepository {
  void clear();
}

class SomeRepository implements IRepository {
  @override
  void clear() {
    print('SomeRepository cleared');
  }
}

abstract class IClosable {
  void doSomething();

  void close();
}

class SomeClosable implements IClosable {
  final IRepository _repository;

  const SomeClosable(this._repository);

  @override
  void doSomething() {
    print('Cool');
  }

  @override
  void close() {
    _repository.clear();
  }
}

// ------------------

final container = Container();

final someRepository = LazySingleton<IRepository>((_) => SomeRepository());
final closable = AsyncFactory<IClosable>(
  (scope) async {
    await Future.delayed(Duration(milliseconds: 100));
    return SomeClosable(
      scope.get(someRepository),
    );
  },
  onDispose: (bloc) async {
    bloc.close();
  },
);

Future<void> main() async {
  final instance = await container.getAsync(closable);
  instance.doSomething();
  await container.dispose(closable, instance);
}
