import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieRating extends StatelessWidget {
  final Movie movie;
  final double height;
  final double width;
  final double fontSize;

  MovieRating(
      {this.movie, this.height = 60, this.width = 60, this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.green[600],
      ),
      child: Center(
        child: Text(
          movie.voteAverage,
          style: TextStyle(
              fontSize: this.fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}