import 'dart:convert';

import 'model/genre_model.dart';
import 'package:http/http.dart' as http;

class GenreBloc {
  final String url = "https://api.themoviedb.org/3/genre/movie/list?api_key=47bc5f07e5862dfdfcd50b6bd3f4aa4d&language=en-US";

  List<GenreModel> genres;

  GenreBloc();

  Future<List<GenreModel>> loadGenreData() async {
    var dataString = await loadAsset();
    Map<String, dynamic> jsonMovieData = jsonDecode(dataString);
    genres = GenreBloc.fromJson(jsonMovieData['genres']).genres;
    return genres;
  }

  Future<String> loadAsset() async {
    var response = await http.get(Uri.encodeFull(url),
        headers: {"Accept": "application/json"});
    return response.body;
  }

  GenreBloc.fromJson(List<dynamic> usersJson)
      : genres = usersJson.map((genres) => GenreModel.fromJson(genres)).toList();

  static List<String> getGenres(List<String> movieGenres, List<GenreModel> genreDatabase, List<dynamic> movieGenreIds) {
    for (int i = 0; i < genreDatabase.length; i++) {
      for (int a = 0; a < movieGenreIds.length; a++) {
        if (genreDatabase[i].id == movieGenreIds[a]) {
          movieGenres.add(genreDatabase[i].name);
        }
      }
    }
    return movieGenres;
  }
}