import 'package:get_it/get_it.dart';
import 'package:imovies/infrastructure/models/imovies_stream.dart';
import 'package:imovies/infrastructure/models/movie.dart';
import 'package:imovies/infrastructure/models/person.dart';
import 'package:imovies/infrastructure/repositories/movie_repository.dart';
import 'package:imovies/infrastructure/repositories/person_repository.dart';

final getIt = GetIt.instance;

class HomeBloc {
  final MovieRepository _movieRepo = getIt();
  final PersonRepository _personRepo = getIt();

  final IMoviesStream<List<Movie>> popularMovies = IMoviesStream<List<Movie>>();

  final IMoviesStream<List<Movie>> topRatedMovies =
      IMoviesStream<List<Movie>>();

  final IMoviesStream<List<Movie>> nowPlayingMovies =
      IMoviesStream<List<Movie>>();

  final IMoviesStream<List<Person>> popularPersons =
      IMoviesStream<List<Person>>();

  void getPopularMovies() => popularMovies.handleFuture(
        _movieRepo.getPopularMovies(),
      );

  void getTopRatedMovies() => topRatedMovies.handleFuture(
        _movieRepo.getTopRatedMovies(),
      );

  void getNowPlayingMovies() => nowPlayingMovies.handleFuture(
        _movieRepo.getNowPlayingMovies(),
      );

  void getPopularPersons() => popularPersons.handleFuture(
        _personRepo.getPopularMovies(),
      );
}
