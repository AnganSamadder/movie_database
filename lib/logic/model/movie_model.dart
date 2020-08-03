import 'package:moviedatabase/logic/genre_bloc.dart';
import 'package:moviedatabase/logic/model/genre_model.dart';

class MovieModel {
  final String poster, title, overview, releaseDate;
  final List<dynamic> genreIds;
//  List<dynamic> genres;

  const MovieModel(this.poster, this.title, this.overview, this.releaseDate, this.genreIds);

  MovieModel.fromJson(Map<String, dynamic> movieJson):
        this.title = movieJson['original_title'],
        this.poster = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/" + movieJson['poster_path'],
        this.overview = movieJson['overview'],
        this.releaseDate = movieJson['release_date'],
        this.genreIds = movieJson['genre_ids'];
  }


