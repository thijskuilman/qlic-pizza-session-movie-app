import 'package:flutter/material.dart';
import 'package:movie_apps/views/movie_list.dart';

void main() {
  runApp(MaterialApp(
      title: "Movie Demo",
      theme: ThemeData(primarySwatch: Colors.red),
      home: MovieList()));
}
