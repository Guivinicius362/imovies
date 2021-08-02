class Person {
  final String? profilePath;
  final bool adult;
  final int id;
  final String name;
  final double popularity;

  Person({
    required this.adult,
    required this.id,
    required this.name,
    required this.popularity,
    this.profilePath,
  });

  static Person fromJson(Map<String, dynamic> json) => Person(
        profilePath: json["profile_path"] as String,
        adult: json["adult"] as bool,
        id: json["id"] as int,
        name: json["name"] as String,
        popularity: json["popularity"] as double,
      );

  String fullProfilePath() {
    if (this.profilePath != null) {
      return "https://image.tmdb.org/t/p/w500/${this.profilePath}";
    } else {
      return "";
    }
  }
}
