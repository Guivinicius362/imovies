import 'package:flutter/material.dart';
import 'package:imovies/design_system/design_system.dart';
import 'package:imovies/infrastructure/models/movie.dart';
import 'package:imovies/presentation/movie/constants/movie_constants.dart';
import 'package:imovies/presentation/movie/widgets/circular_clipper.dart';

class MoviePage extends StatefulWidget {
  final Movie movie;

  MoviePage({required this.movie});

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: widget.movie.fullBackdropPath(),
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.movie.fullBackdropPath()),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(10.0),
                    elevation: 12.0,
                    onPressed: () => print('Play Video'),
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow,
                      size: 60.0,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 20.0,
                child: IconButton(
                  onPressed: () => print('Add to My List'),
                  icon: Icon(Icons.add),
                  iconSize: 40.0,
                  color: lightColor,
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 25.0,
                child: IconButton(
                  onPressed: () => print('Share'),
                  icon: Icon(Icons.share),
                  iconSize: 35.0,
                  color: lightColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.movie.title.toUpperCase(),
                  style: titleStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                SizedBox(height: 12.0),
                Text(
                  score(widget.movie.popularity.toString()),
                  style: subTitleStyle.copyWith(fontSize: 20),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          year,
                          style: titleStyle,
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.movie.releaseDate ?? "-",
                          style: subTitleStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          language,
                          style: titleStyle,
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.movie.originalLanguage.toUpperCase(),
                          style: subTitleStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25.0),
                Container(
                  height: 120.0,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.movie.overview,
                      style: TextStyle(
                        color: lightColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
