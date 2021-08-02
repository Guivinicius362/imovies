import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imovies/infrastructure/di/get_it_boostrap.dart';
import 'package:imovies/presentation/home/pages/home/home_page.dart';
import 'package:imovies/presentation/routes/routes.dart';

void main() {
  // start dependency injection
  boot();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMovies',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      home: HomePage(),
      routes: imoviesRoutes,
    );
  }
}
