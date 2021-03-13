import 'package:lovely_di/lovely_di.dart';

import 'api_client.dart';
import 'movie_presenter.dart';

final container = Container();

final apiClientBlueprint = LazySingleton<IMovieApiClient>(
  (scope) => ExampleMovieApiClient(),
);

final moviePresenterBlueprint = AsyncFactory<IMoviePresenter>(
  // Async initialization.
  (scope) async => await ExampleMoviePresenter.create(
    scope.get(apiClientBlueprint),
  ),
  onDispose: (presenter) async {
    presenter.close();
  },
);

Future<void> main() async {
  final presenter = await container.getAsync(moviePresenterBlueprint);

  // Prints 'Shrek, Spirited Away, Rush'.
  await presenter.showTitles();

  // Prints 'ExampleMoviePresenter closed'.
  await container.dispose(moviePresenterBlueprint, presenter);
}
