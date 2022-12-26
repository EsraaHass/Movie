import 'package:flutter/material.dart';
import 'package:movies/core/services/services_locator.dart';
import 'package:movies/movies/presentation/screens/movies_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Movie App', home: MoviesScreen());
  }
}

