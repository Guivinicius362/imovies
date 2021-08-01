import 'package:flutter/material.dart';
import 'package:imovies/infrastructure/models/movie.dart';
import 'package:imovies/presentation/home/pages/movie/movie_page.dart';
import 'package:shimmer/shimmer.dart';

class WideMovieCard extends StatelessWidget {
  final PageController pageController;
  final List<Movie> movies;
  final int index;

  const WideMovieCard({
    Key? key,
    required this.pageController,
    required this.index,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page! - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MoviePage(movie: movies[index]),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: movies[index].fullBackdropPath(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: NetworkImage(
                          movies[index].fullBackdropPath(),
                        ),
                        height: 220.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 40.0,
              child: Container(
                width: 250.0,
                child: Text(
                  movies[index].title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget shimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(0.0, 4.0),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Center(
          child: SizedBox(
            height: 200.0,
          ),
        ),
      ),
    );
  }
}
