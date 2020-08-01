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
//    var genres = Provider.of<List<GenreModel>>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Movies'),
          backgroundColor: Colors.redAccent,
        ),
        body: movies == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: movies.length == null ? 0 : movies.length,
                itemBuilder: (_, int index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    child: Column(
                      children: <Widget>[
                        movies[index].poster == null
                            ? Image.asset('images/loading.gif')
                            : FadeInImage.assetNetwork(
                                placeholder: 'images/loading.gif',
                                image:
                                    "https://image.tmdb.org/t/p/w600_and_h900_bestv2/" +
                                        movies[index].poster
                            ),
                        Text(
                          movies[index].title,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => DescriptionScreen(
                            moviePoster: movies[index].poster,
                            movieTitle: movies[index].title,
                            movieOverview: movies[index].overview,
                            movieReleaseDate: movies[index].releaseDate,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ));
  }
}
