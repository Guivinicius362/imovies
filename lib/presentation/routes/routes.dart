import 'package:flutter/material.dart';
import 'package:imovies/presentation/home/pages/home/home_page.dart';
import 'package:imovies/presentation/movie/pages/movie/movie_page.dart';
import 'package:imovies/presentation/routes/arguments/movie_details_arg.dart';

const homeRoute = "/home";
const movieDetails = "/movie_details";

final Map<String, WidgetBuilder> imoviesRoutes = {
  homeRoute: (BuildContext context) => HomePage(),
  movieDetails: (BuildContext context) => MoviePage(
        args: getArg<MovieDetailsArg>(context),
      )
};

T getArg<T>(BuildContext context) =>
    ModalRoute.of(context)!.settings.arguments as T;
