import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../components/movie_rating.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.black,
      ),
      body: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: movie.getBackdropImage(),
              fit: BoxFit.cover,
              alignment: Alignment.center,
              colorFilter: new ColorFilter.mode(
                Colors.red.withOpacity(0.5),
                BlendMode.dstATop,
              ),
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 80, bottom: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: Colors.black26,
                      offset: Offset(4.0, 4.0),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  movie.overview,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: MovieRating(movie: movie),
              )
            ],
          )),
    );
  }
}
