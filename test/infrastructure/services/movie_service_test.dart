import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:imovies/infrastructure/services/movie_service.dart';
import 'package:mocktail/mocktail.dart';

import '../../presentation/home/constants/home_lists_mock.dart';

final getIt = GetIt.instance;

class MockClient extends Mock implements Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  final client = MockClient();

  setUpAll(() async {
    registerFallbackValue(FakeUri());
    GetIt.instance.registerFactory<Client>(() => client);
  });

  final response = Response(movieJson, 200);

  test('MovieService_GetPopularMovieWasCalled_ShouldCallHttpClient', () async {
    when(() => client.get(any())).thenAnswer(
      (invocation) => Future.value(response),
    );

    final service = MovieService();

    final result = await service.getPopularMovies();

    verify(() => client.get(any())).called(1);
    expect(result is Response, true);
    expect(result.statusCode, 200);
  });
  test('MovieService_GetTopRatedWasCalled_ShouldCallHttpClient', () async {
    when(() => client.get(any())).thenAnswer(
      (invocation) => Future.value(response),
    );

    final service = MovieService();

    final result = await service.getTopRatedMovies();

    verify(() => client.get(any())).called(1);
    expect(result is Response, true);
    expect(result.statusCode, 200);
  });
  test('MovieService_GetNowPlayingWasCalled_ShouldCallHttpClient', () async {
    when(() => client.get(any())).thenAnswer(
      (invocation) => Future.value(response),
    );

    final service = MovieService();

    final result = await service.getNowPlayingMovies();

    verify(() => client.get(any())).called(1);
    expect(result is Response, true);
    expect(result.statusCode, 200);
  });
}
