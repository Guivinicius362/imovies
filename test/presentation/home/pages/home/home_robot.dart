import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imovies/infrastructure/models/imovies_stream.dart';
import 'package:imovies/infrastructure/models/movie.dart';
import 'package:imovies/infrastructure/models/person.dart';
import 'package:imovies/presentation/home/pages/home/home_bloc.dart';
import 'package:imovies/presentation/home/pages/home/home_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../constants/home_lists_mock.dart';

class MockHomeBloc extends Mock implements HomeBloc {}

class HomeRobot {
  final _bloc = MockHomeBloc();
  final WidgetTester _tester;

  HomeRobot(this._tester);

  Finder get _page => find.byType(MaterialApp);

  Future<void> configurePage() async {
    _tester.binding.window.physicalSizeTestValue = Size(1920, 1920 * 2);

    await _tester.pumpWidget(
      MaterialApp(
        home: HomePage(
          bloc: _bloc,
        ),
      ),
    );
  }

  Future<void> configurePageSucess() async {
    _tester.binding.window.physicalSizeTestValue = Size(1920, 1920 * 2);
    configurePopularMovies();
    configureNowPlayingMovies();
    configureTopRatedMovies();
    configurePopularPersons();

    await _tester.pumpWidget(
      MaterialApp(
        home: HomePage(
          bloc: _bloc,
        ),
      ),
    );
  }

  Future<void> wait() async => await _tester.pumpAndSettle(
        Duration(
          seconds: 5,
        ),
      );

  void configurePopularMovies() {
    final stream = IMoviesStream<List<Movie>>();
    stream.add(movieList());
    when(() => _bloc.popularMovies).thenAnswer(
      (invocation) => stream,
    );
  }

  void configureNowPlayingMovies() {
    final stream = IMoviesStream<List<Movie>>();
    stream.add(movieList());
    when(() => _bloc.nowPlayingMovies).thenAnswer(
      (invocation) => stream,
    );
  }

  void configureTopRatedMovies() {
    final stream = IMoviesStream<List<Movie>>();
    stream.add(movieList());
    when(() => _bloc.topRatedMovies).thenAnswer(
      (invocation) => stream,
    );
  }

  void configurePopularPersons() {
    final stream = IMoviesStream<List<Person>>();
    stream.add(personList());
    when(() => _bloc.popularPersons).thenAnswer(
      (invocation) => stream,
    );
  }

  void configurePopularMoviesError() {
    final stream = IMoviesStream<List<Movie>>();
    stream.addError(movieList());
    when(() => _bloc.popularMovies).thenAnswer(
      (invocation) => stream,
    );
  }

  void configureTopRatedMoviesError() {
    final stream = IMoviesStream<List<Movie>>();
    stream.addError(movieList());
    when(() => _bloc.topRatedMovies).thenAnswer(
      (invocation) => stream,
    );
  }

  void configureNowPlayingMoviesError() {
    final stream = IMoviesStream<List<Movie>>();
    stream.addError(movieList());
    when(() => _bloc.nowPlayingMovies).thenAnswer(
      (invocation) => stream,
    );
  }

  void configurePopularPersonError() {
    final stream = IMoviesStream<List<Person>>();
    stream.addError(personList());
    when(() => _bloc.popularPersons).thenAnswer(
      (invocation) => stream,
    );
  }

  void assertPageShimmerWasEnabled() async {
    await expectLater(
      _page,
      matchesGoldenFile('./golden_files/screen_with_shimmer.png'),
    );
  }

  void assertPageWasLoaded() async {
    await expectLater(
      _page,
      matchesGoldenFile('./golden_files/screen_with_data.png'),
    );
  }

  void assertPopularMoviesHasError() async {
    await expectLater(
      _page,
      matchesGoldenFile('./golden_files/screen_with_popular_movies_error.png'),
    );
  }

  void assertTopRatedMoviesHasError() async {
    await expectLater(
      _page,
      matchesGoldenFile(
          './golden_files/screen_with_top_rated_movies_error.png'),
    );
  }

  void assertNowPlayingMoviesHasError() async {
    await expectLater(
      _page,
      matchesGoldenFile(
          './golden_files/screen_with_now_playing_movies_error.png'),
    );
  }

  void assertPopularPersonHasError() async {
    await expectLater(
      _page,
      matchesGoldenFile(
          './golden_files/screen_with_popular_person_error.png'),
    );
  }
}