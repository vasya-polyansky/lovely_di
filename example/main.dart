import 'package:lovely_di/lovely_di.dart';

abstract class IRepository {
  void clear();
}

class SomeRepository implements IRepository {
  @override
  void clear() {
    print('SomeRepository cleaned');
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

final repositoryDependency = Singleton<IRepository>(SomeRepository());
final closableDependency = Factory<IClosable>(
  () => SomeClosable(container(repositoryDependency)),
  onDispose: (bloc) async {
    bloc.close();
  },
);

void main() {
  final closable = container(closableDependency);
  closable.doSomething();
  container.dispose(closableDependency, closable);
}
