import 'api_client.dart';

abstract class IMoviePresenter {
  Future<void> showTitles();

  void close();
}

class ExampleMoviePresenter implements IMoviePresenter {
  final IMovieApiClient _client;

  const ExampleMoviePresenter._(this._client);

  static Future<ExampleMoviePresenter> create(
    IMovieApiClient client,
  ) async {
    await Future.delayed(const Duration(milliseconds: 100)); // for demonstration purpose;
    return ExampleMoviePresenter._(client);
  }

  @override
  Future<void> showTitles() async {
    final titles = await _client.getTitles();
    print(titles.join(', '));
  }

  @override
  void close() {
    print('ExampleMoviePresenter closed');
  }
}
