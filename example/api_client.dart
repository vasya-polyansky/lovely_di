abstract class IMovieApiClient {
  Future<List<String>> getTitles();
}

class ExampleMovieApiClient implements IMovieApiClient {
  @override
  Future<List<String>> getTitles() async => ['Shrek', 'Spirited Away', 'Rush'];
}
