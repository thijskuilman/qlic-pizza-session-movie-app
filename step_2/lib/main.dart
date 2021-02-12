import 'package:flutter/material.dart';
import 'views/movie_list.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Movie Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MovieList()
    ),
  );
}
