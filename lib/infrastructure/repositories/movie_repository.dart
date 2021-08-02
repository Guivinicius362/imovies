import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:imovies/infrastructure/models/movie.dart';
import 'package:imovies/infrastructure/models/response_wrapper.dart';
import 'package:imovies/infrastructure/services/movie_service.dart';

final getIt = GetIt.instance;

class MovieRepository {
  final MovieService _movieService = getIt<MovieService>();

  Future<List<Movie>> getPopularMovies() async => _parseMovieList(
        await _movieService.getPopularMovies(),
      );

  Future<List<Movie>> getTopRatedMovies() async => _parseMovieList(
        await _movieService.getTopRatedMovies(),
      );

  Future<List<Movie>> getNowPlayingMovies() async => _parseMovieList(
        await _movieService.getNowPlayingMovies(),
      );

  List<Movie> _parseMovieList(Response response) {
    var body = json.decode(response.body);
    TheMovieDBWrapper wrapper = TheMovieDBWrapper.fromJson(body);

    return wrapper.results
        .map(
          (e) => Movie.fromJson(e),
        )
        .toList();
  }
}
