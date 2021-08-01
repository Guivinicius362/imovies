import 'package:flutter/material.dart';
import 'package:imovies/infrastructure/di/get_it_boostrap.dart';
import 'package:imovies/presentation/home/pages/home/home_page.dart';

void main() {
  boot();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
