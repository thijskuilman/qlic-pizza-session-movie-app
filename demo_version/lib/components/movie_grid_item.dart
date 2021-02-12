import 'package:flutter/material.dart';
import 'package:movie_apps/components/movie_rank_label.dart';
import 'package:movie_apps/models/movie.dart';
import 'package:movie_apps/views/movie_detail.dart';

class MovieGridItem extends StatelessWidget {
  final Movie movie;
  final int index;

  const MovieGridItem(this.movie, this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetail(movie)),
        );
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
              ),
            ],
            image: DecorationImage(
              image: movie.getPosterImage(),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomRight,
          child: MovieRankLabel(
            ranking: index + 1,
          )),
    );
  }
}
