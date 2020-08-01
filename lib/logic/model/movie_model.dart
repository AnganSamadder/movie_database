import 'package:moviedatabase/logic/genre_bloc.dart';
import 'package:moviedatabase/logic/model/genre_model.dart';

class MovieModel {
  final String poster, title, overview, releaseDate;
//  final List<int> genreIds;
//  final List<GenreModel> genreList;
//  final List<String> genres;

  const MovieModel(this.poster, this.title, this.overview, this.releaseDate/*, this.genreIds*/);

  MovieModel.fromJson(Map<String, dynamic> movieJson):
        this.title = movieJson['original_title'],
        this.poster = movieJson['poster_path'],
        this.overview = movieJson['overview'],
        this.releaseDate = movieJson['release_date'];
//        this.genreIds = movieJson['genre_ids'];
//        this.genres = GenreBloc.getGenres(genres, genreList, genreIds);

//  static List<String> getGenres(List<String> movieGenres, List<GenreModel> genreDatabase, List<int> movieGenreIds) {
//    for (int i = 0; i < genreDatabase.length; i++) {
//      for (int a = 0; i < movieGenreIds.length; a++) {
//        if (genreDatabase[i].id == movieGenreIds[a]) {
//          movieGenres.add(genreDatabase[i].name);
//        }
//      }
//    }
//    return movieGenres;
//  }
  }


