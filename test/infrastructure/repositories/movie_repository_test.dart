import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:imovies/infrastructure/models/movie.dart';
import 'package:imovies/infrastructure/repositories/movie_repository.dart';
import 'package:imovies/infrastructure/services/movie_service.dart';
import 'package:mocktail/mocktail.dart';

import '../../presentation/home/constants/home_lists_mock.dart';

final getIt = GetIt.instance;

class MockMovieService extends Mock implements MovieService {}

void main() {
  final service = MockMovieService();

  setUpAll(() async {
    GetIt.instance.registerFactory<MovieService>(() => service);
  });

  final response = Response(movieJson, 200);

  test('MovieRepository_GetPopularMovieWasCalled_ShouldParseResponse',
      () async {
    when(() => service.getPopularMovies()).thenAnswer(
      (invocation) => Future.value(response),
    );

    final repo = MovieRepository();

    final result = await repo.getPopularMovies();

    expect(result is List<Movie>, true);
    expect(result.length, 1);
  });
  test('MovieRepository_GetTopRatedWasCalled_ShouldParseResponse', () async {
    when(() => service.getTopRatedMovies()).thenAnswer(
      (invocation) => Future.value(response),
    );

    final repo = MovieRepository();

    final result = await repo.getTopRatedMovies();

    expect(result is List<Movie>, true);
    expect(result.length, 1);
  });

  test('MovieRepository_GetNowPlayingWasCalled_ShouldParseResponse', () async {
    when(() => service.getNowPlayingMovies()).thenAnswer(
      (invocation) => Future.value(response),
    );

    final repo = MovieRepository();

    final result = await repo.getNowPlayingMovies();

    expect(result is List<Movie>, true);
    expect(result.length, 1);
  });
}
