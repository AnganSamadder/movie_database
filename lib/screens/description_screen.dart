import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviedatabase/logic/genre_bloc.dart';
import 'package:moviedatabase/logic/model/genre_model.dart';
import 'package:moviedatabase/logic/movie_bloc.dart';

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
    String releaseDateName;
    releaseDateName = MovieBloc.releaseDate(movieReleaseDate);
      return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black54,
                    BlendMode.darken
                ),
                fit: BoxFit.cover,
                image: NetworkImage(
                  movieBackdrop
                ),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
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
                                    "Release Date:",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    releaseDateName,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
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
                                      primary: false,
                                      reverse: false,
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
                    Expanded(
                      flex: 2,
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
                          SizedBox(
                            height: 5.0,
                          ),
                          Expanded(
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              children: <Widget>[
                                Text(
                                  movieOverview,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}