import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:imovies/infrastructure/models/movie.dart';
import 'package:imovies/infrastructure/models/person.dart';
import 'package:imovies/infrastructure/repositories/movie_repository.dart';
import 'package:imovies/infrastructure/repositories/person_repository.dart';
import 'package:imovies/presentation/home/pages/home/home_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../constants/home_lists_mock.dart';

final getIt = GetIt.instance;

class MockMovieRepo extends Mock implements MovieRepository {}

class MockPersonRepo extends Mock implements PersonRepository {}

void main() {
  final movieRepo = MockMovieRepo();
  final personRepo = MockPersonRepo();

  setUpAll(() async {
    GetIt.instance.registerFactory<MovieRepository>(() => movieRepo);
    GetIt.instance.registerFactory<PersonRepository>(() => personRepo);
  });

  test('HomeBloc_GetPopularMovieWasCalled_ShouldCallRepositoryAndUpdateStream',
      () async {
    when(() => movieRepo.getPopularMovies()).thenAnswer(
      (invocation) => Future.value(movieList()),
    );

    final bloc = HomeBloc();

    verifyNever(() => bloc.getPopularMovies());

    bloc.getPopularMovies();

    verify(() => bloc.getPopularMovies()).called(1);

    bloc.popularMovies.stream.listen((event) {
      expect(event is List<Movie>, true);
      expect(event.length, 3);
    });
  });
  test('HomeBloc_GetTopRatedWasCalled_ShouldCallRepositoryAndUpdateStream',
      () async {
    when(() => movieRepo.getTopRatedMovies()).thenAnswer(
      (invocation) => Future.value(movieList()),
    );

    final bloc = HomeBloc();

    verifyNever(() => bloc.getTopRatedMovies());

    bloc.getTopRatedMovies();

    verify(() => bloc.getTopRatedMovies()).called(1);

    bloc.topRatedMovies.stream.listen((event) {
      expect(event is List<Movie>, true);
      expect(event.length, 3);
    });
  });
  test('HomeBloc_GetNowPlayingWasCalled_ShouldCallRepositoryAndUpdateStream',
      () async {
    when(() => movieRepo.getNowPlayingMovies()).thenAnswer(
      (invocation) => Future.value(movieList()),
    );

    final bloc = HomeBloc();

    verifyNever(() => bloc.getNowPlayingMovies());

    bloc.getNowPlayingMovies();

    verify(() => bloc.getNowPlayingMovies()).called(1);

    bloc.nowPlayingMovies.stream.listen((event) {
      expect(event is List<Movie>, true);
      expect(event.length, 3);
    });
  });
  test('HomeBloc_GetPopularPersonWasCalled_ShouldCallRepositoryAndUpdateStream',
      () async {
    when(() => personRepo.getPopularPersons()).thenAnswer(
      (invocation) => Future.value(personList()),
    );

    final bloc = HomeBloc();

    verifyNever(() => bloc.getPopularPersons());

    bloc.getPopularPersons();

    verify(() => bloc.getPopularPersons()).called(1);

    bloc.popularPersons.stream.listen((event) {
      expect(event is List<Person>, true);
      expect(event.length, 1);
    });
  });
}
