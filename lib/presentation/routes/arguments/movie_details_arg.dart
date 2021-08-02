import 'package:imovies/infrastructure/models/movie.dart';

class MovieDetailsArg {
  final Movie movie;
  final bool wide;

  MovieDetailsArg({
    required this.movie,
    this.wide = false,
  });
}
