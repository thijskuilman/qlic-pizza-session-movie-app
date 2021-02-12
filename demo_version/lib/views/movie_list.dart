import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_apps/components/movie_grid_item.dart';
import 'package:movie_apps/models/movie.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<Movie> movies = List<Movie>();

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  fetchMovies() async {
    final response = await http.get(
        'https://api.themoviedb.org/3/discover/movie?api_key=2a51206bed4c5b1bac9e990bbd6a1231&include_adult=false&sort_by=vote_average.desc&vote_count.gte=15000&language=en-US');

    if (response.statusCode == 200) {
      List<Movie> result = List<Movie>();
      for (var jsonData in jsonDecode(response.body)["results"] as List) {
        result.add(Movie.fromJson(jsonData));
      }
      setState(() {
        movies = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Rated Movies"),
      ),
      backgroundColor: Colors.grey[800],
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 2 / 3,
        ),
        padding: EdgeInsets.all(8),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieGridItem(movies[index], index);
        },
      ),
    );
  }
}
