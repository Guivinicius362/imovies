class TheMovieDBWrapper<T> {
  final int? page;
  final int? totalResults;
  final int? totalPages;
  final List<dynamic> results;

  TheMovieDBWrapper({
    required this.page,
    required this.totalResults,
    required this.totalPages,
    required this.results,
  });

  static TheMovieDBWrapper fromJson(Map<String, dynamic> json) =>
      TheMovieDBWrapper(
        totalPages: json["page"] as int?,
        totalResults: json["total_page"] as int?,
        page: json["total_result"] as int?,
        results: json["results"] as List<dynamic>,
      );
}
