import 'package:flutter/material.dart';
import 'package:movie_demo_app/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_demo_app/views/movie_detail.dart';

class MovieList extends StatefulWidget {
  const MovieList();

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
      List<Movie> moviesResult = List<Movie>();
      for (var jsonData in jsonDecode(response.body)["results"] as List) {
        moviesResult.add(Movie.fromJson(jsonData));
      }
      setState(() {
        movies = moviesResult;
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
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          padding: const EdgeInsets.all(8),
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieDetail(movies[index])),
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
                      image: movies[index].getPosterImage(), fit: BoxFit.cover),
                ),
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 40,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      '#${(index + 1).toString()}',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
