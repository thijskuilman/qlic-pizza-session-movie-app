import 'package:flutter/material.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String voteAverage;

  Movie(
      {this.id,
      this.title,
      this.overview,
      this.posterPath,
      this.backdropPath,
      this.voteAverage});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage: json['vote_average'].toString(),
    );
  }

  NetworkImage getPosterImage() {
    return NetworkImage(
        'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/$posterPath');
  }

  NetworkImage getBackdropImage() {
    return NetworkImage(
        'https://www.themoviedb.org/t/p/w1920_and_h800_face/$backdropPath');
  }
}
