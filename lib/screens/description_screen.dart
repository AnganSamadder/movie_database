import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget{
  final String moviePoster;
  final String movieTitle;
  final String movieOverview;
  final String movieReleaseDate;
//  final List<String> movieGenres;

  const DescriptionScreen({Key key, this.moviePoster, this.movieTitle, this.movieOverview, this.movieReleaseDate/*, this.movieGenres*/}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
                  Image.network("https://image.tmdb.org/t/p/w600_and_h900_bestv2/" + moviePoster)
            ],
          ),
        ),
      ),
    );
  }
}