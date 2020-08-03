import 'package:flutter/material.dart';
import 'package:moviedatabase/logic/genre_bloc.dart';
import 'package:moviedatabase/logic/model/genre_model.dart';

class DescriptionScreen extends StatelessWidget {
  final String moviePoster;
  final String movieTitle;
  final String movieOverview;
  final String movieReleaseDate;
  final List<dynamic> genreIds;
  final List<GenreModel> genreDatabase;

//  final List<String> movieGenres;

  const DescriptionScreen(
      {Key key, this.moviePoster, this.movieTitle, this.movieOverview, this.movieReleaseDate, this.genreIds, this.genreDatabase})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> genres = [];
    genres = GenreBloc.getGenres(genres, genreDatabase, genreIds);
    print(genres);
    return Scaffold(
        body: Column(
          children: <Widget>[
            Image.network(moviePoster),
            ListView.builder(
              shrinkWrap: true,
              itemCount: genres.length == null ? 0 : genres.length,
              itemBuilder: (_, int index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      genres[index]
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}