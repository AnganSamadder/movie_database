import 'dart:convert';

import 'package:moviedatabase/logic/genre_bloc.dart';

import 'model/movie_model.dart';
import 'movie_list.dart';
import 'package:http/http.dart' as http;

class MovieBloc {
   final String url = "https://api.themoviedb.org/4/list/1?page=1&api_key=47bc5f07e5862dfdfcd50b6bd3f4aa4d";

   List<MovieModel> movies;

   Future<List<MovieModel>> loadMovieData() async {
    var dataString = await loadAsset();
    Map<String, dynamic> jsonMovieData = jsonDecode(dataString);
    movies = MovieList.fromJson(jsonMovieData['results']).movieList;
    return movies;
  }

   Future<String> loadAsset() async {
    var response = await http.get(Uri.encodeFull(url),
        headers: {"Accept": "application/json"});
    return response.body;
  }
}