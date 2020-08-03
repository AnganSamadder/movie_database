import 'dart:ui' as ui;
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviedatabase/logic/genre_bloc.dart';
import 'package:moviedatabase/logic/model/genre_model.dart';

class DescriptionScreen extends StatelessWidget {
  final String movieTitle;
  final String moviePoster;
  final String movieBackdrop;
  final String movieOverview;
  final String movieReleaseDate;
  final List<dynamic> genreIds;
  final List<GenreModel> genreDatabase;

//  final List<String> movieGenres;

  const DescriptionScreen(
      {Key key,
      this.movieTitle,
      this.moviePoster,
      this.movieBackdrop,
      this.movieOverview,
      this.movieReleaseDate,
      this.genreIds,
      this.genreDatabase})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> genres = [];
    genres = GenreBloc.getGenres(genres, genreDatabase, genreIds);
    Image backdrop = new Image.network(movieBackdrop);
    Completer<ui.Image> completer = new Completer<ui.Image>();
    backdrop.image
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info.image);
    }));
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.network(
              movieBackdrop,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
              fit: BoxFit.contain,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.network(
                            moviePoster,
                            scale: 3.0,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    movieTitle,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Text(
                                  "Genres:",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Flexible(
                                  child: ListView.builder(
                                    itemCount: genres.length == null ? 0 : genres.length,
                                    itemBuilder: (_, int index) => Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          genres[index],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ]
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Overview",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            movieOverview,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}