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

final repositoryDependency = LazySingleton<IRepository>((_) => SomeRepository());
final closableDependency = AsyncFactory<IClosable>(
  (scope) async {
    await Future.delayed(Duration(milliseconds: 100));
    return SomeClosable(
      scope.get(repositoryDependency),
    );
  },
  onDispose: (bloc) async {
    bloc.close();
  },
);

Future<void> main() async {
  final closable = await container.getAsync(closableDependency);
  closable.doSomething();
  await container.dispose(closableDependency, closable);
}
