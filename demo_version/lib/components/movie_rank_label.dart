import 'package:flutter/material.dart';

class MovieRankLabel extends StatelessWidget {
  final int ranking;

  MovieRankLabel({this.ranking});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          '#$ranking',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
