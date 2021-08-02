class Movie {
  final String? posterPath;
  final bool adult;
  final String overview;
  final String? releaseDate;
  final int id;
  final String originalTitle;
  final String originalLanguage;
  final String title;
  final String? backdropPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final double voteAverage;

  Movie({
    this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });

  static Movie fromJson(Map<String, dynamic> json) => Movie(
        posterPath: json["poster_path"] as String?,
        adult: json["adult"] as bool,
        overview: json["overview"] as String,
        releaseDate: json["release_date"] as String?,
        id: json["id"] as int,
        originalTitle: json["original_title"] as String,
        originalLanguage: json["original_language"] as String,
        title: json["title"] as String,
        backdropPath: json["backdrop_path"] as String?,
        popularity: json["popularity"] as double,
        voteCount: json["vote_count"] as int,
        video: json["video"] as bool,
        voteAverage: 0.0,
      );

  String fullPosterPath() {
    if (this.posterPath != null) {
      return "https://image.tmdb.org/t/p/w500/${this.posterPath}";
    } else {
      return "";
    }
  }

  String fullBackdropPath() {
    if (this.backdropPath != null) {
      return "https://image.tmdb.org/t/p/w500/${this.backdropPath}";
    } else {
      return "";
    }
  }
}
