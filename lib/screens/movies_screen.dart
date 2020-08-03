import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:moviedatabase/logic/model/movie_model.dart';
import 'package:moviedatabase/logic/model/genre_model.dart';
import 'package:moviedatabase/logic/movie_bloc.dart';
import 'package:moviedatabase/logic/genre_bloc.dart';

import 'description_screen.dart';

class LoadMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          FutureProvider(
              create: (BuildContext context) => MovieBloc().loadMovieData()),
          FutureProvider(
              create: (BuildContext context) => GenreBloc().loadGenreData()),
        ],
        child: MoviesScreen(),
      );
}

class MoviesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var movies = Provider.of<List<MovieModel>>(context);
    var genres = Provider.of<List<GenreModel>>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Movies'),
          backgroundColor: Colors.redAccent,
        ),
        body: movies == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: movies.length == null ? 0 : (movies.length/2).round(),
                itemBuilder: (_, int index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 30)/ 2,
                          child: GestureDetector(
                            child: Column(
                              children: <Widget>[
                                movies[index*2].poster == null
                                    ? Image.asset('images/loading.gif')
                                    : FadeInImage.assetNetwork(
                                        placeholder: 'images/loading.gif',
                                        image: movies[index*2].poster),
                                Text(
                                  movies[index*2].title,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => DescriptionScreen(
                                    movieTitle: movies[index*2].title,
                                    moviePoster: movies[index*2].poster,
                                    movieBackdrop: movies[index*2].backdrop,
                                    movieOverview: movies[index*2].overview,
                                    movieReleaseDate: movies[index*2].releaseDate,
                                    genreIds: movies[index*2].genreIds,
                                    genreDatabase: genres,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      index*2+1 < movies.length
                      ? Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 30)/ 2,
                          child: GestureDetector(
                            child: Column(
                              children: <Widget>[
                                movies[index*2+1].poster == null
                                    ? Image.asset('images/loading.gif')
                                    : FadeInImage.assetNetwork(
                                    placeholder: 'images/loading.gif',
                                    image: movies[index*2+1].poster),
                                Text(
                                  movies[index*2+1].title,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => DescriptionScreen(
                                    movieTitle: movies[index*2+1].title,
                                    moviePoster: movies[index*2+1].poster,
                                    movieBackdrop: movies[index*2+1].backdrop,
                                    movieOverview: movies[index*2+1].overview,
                                    movieReleaseDate: movies[index*2+1].releaseDate,
                                    genreIds: movies[index*2+1].genreIds,
                                    genreDatabase: genres,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                      : Expanded(),
                    ],
                  ),
                ),
              )
    );
  }
}
