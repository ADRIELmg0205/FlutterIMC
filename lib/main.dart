import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flymovies/pages/mainpage.dart';

void main() {
  runApp(const FlyMoviesApp());
}

class FlyMoviesApp extends StatelessWidget {
  const FlyMoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlyMovies App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MainPage(title: 'FlyMovies App')

    );
  }
}