import 'package:moviedatabase/logic/genre_bloc.dart';
import 'package:moviedatabase/logic/model/genre_model.dart';

class MovieModel {
  final String title, poster, backdrop, overview, releaseDate;
  final List<dynamic> genreIds;
//  List<dynamic> genres;

  const MovieModel(this.title, this.poster, this.backdrop, this.overview, this.releaseDate, this.genreIds);

  MovieModel.fromJson(Map<String, dynamic> movieJson):
        this.title = movieJson['original_title'],
        this.poster = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/" + movieJson['poster_path'],
        this.backdrop = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/" + movieJson['backdrop_path'],
        this.overview = movieJson['overview'],
        this.releaseDate = movieJson['release_date'],
        this.genreIds = movieJson['genre_ids'];
  }


