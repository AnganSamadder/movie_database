import 'model/movie_model.dart';

class MovieList {
  final List<MovieModel> movieList;

  MovieList(this.movieList);

  MovieList.fromJson(List<dynamic> usersJson)
      : movieList = usersJson.map(
          (movies) => MovieModel.fromJson(movies)).toList();
}