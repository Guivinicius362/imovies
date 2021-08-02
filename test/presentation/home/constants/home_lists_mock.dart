import 'dart:convert';

import 'package:imovies/infrastructure/models/movie.dart';
import 'package:imovies/infrastructure/models/person.dart';

movieList() => [
      Movie(
        adult: true,
        id: 1,
        overview: "",
        popularity: 3223.0,
        releaseDate: "22/05/2000",
        originalLanguage: "",
        originalTitle: "Fnatic",
        title: "Fnatic",
        video: false,
        voteCount: 10,
        voteAverage: 100,
      ),
      Movie(
        adult: true,
        id: 1,
        overview: "",
        popularity: 3223.0,
        releaseDate: "22/05/2000",
        originalLanguage: "",
        originalTitle: "Fnatic",
        title: "Fnatic",
        video: false,
        voteCount: 10,
        voteAverage: 100,
      ),
      Movie(
        adult: true,
        id: 1,
        overview: "",
        popularity: 3223.0,
        releaseDate: "22/05/2000",
        originalLanguage: "",
        originalTitle: "Fnatic",
        title: "Fnatic",
        video: false,
        voteCount: 10,
        voteAverage: 100,
      ),
    ];
personList() => [
      Person(
        adult: true,
        id: 1,
        popularity: 3223.0,
        name: "Fnatic",
      ),
    ];

final movieJson = jsonEncode(
  {
    "dates": {"maximum": "2021-07-31", "minimum": "2021-06-13"},
    "page": 1,
    "results": [
      {
        "adult": false,
        "backdrop_path": "/gGTCDNEvwG848u34Op1nZNALLUr.jpg",
        "genre_ids": [28, 80, 53],
        "id": 385128,
        "original_language": "en",
        "original_title": "F9",
        "overview":
            "Dominic Toretto and his crew battle the most skilled assassin and high-performance driver they've ever encountered: his forsaken brother.",
        "popularity": 5860.581,
        "poster_path": "/bOFaAXmWWXC3Rbv4u4uM9ZSzRXP.jpg",
        "release_date": "2021-05-19",
        "title": "F9",
        "video": false,
        "vote_average": 7.8,
        "vote_count": 1728
      },
    ],
    "total_pages": 56,
    "total_results": 1112
  },
);
