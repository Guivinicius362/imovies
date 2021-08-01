import 'package:imovies/infrastructure/models/imovies_stream.dart';
import 'package:imovies/infrastructure/models/movie.dart';
import 'package:imovies/infrastructure/repositories/movie_repository.dart';
import 'package:imovies/infrastructure/services/movie_service.dart';

class HomeBloc {
  final MovieRepository _repo = getIt<MovieRepository>();

  final IMoviesStream<List<Movie>> popularMovies = IMoviesStream<List<Movie>>();
  final IMoviesStream<List<Movie>> topRatedMovies =
      IMoviesStream<List<Movie>>();
  final IMoviesStream<List<Movie>> nowPlayingMovies =
      IMoviesStream<List<Movie>>();

  void getPopularMovies() => _repo
      .getPopularMovies()
      .then(
        (value) => popularMovies.add(
          value,
        ),
      )
      .onError(
        (error, stackTrace) => popularMovies.addError(
          error,
        ),
      );

  void getTopRatedMovies() => _repo
      .getTopRatedMovies()
      .then(
        (value) => topRatedMovies.add(
          value,
        ),
      )
      .onError(
        (error, stackTrace) => topRatedMovies.addError(
          error,
        ),
      );

  void getNowPlayingMovies() => _repo
      .getNowPlayingMovies()
      .then(
        (value) => nowPlayingMovies.add(
          value,
        ),
      )
      .onError(
        (error, stackTrace) => nowPlayingMovies.addError(
          error,
        ),
      );
}
