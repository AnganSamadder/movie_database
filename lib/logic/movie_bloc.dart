import 'dart:convert';

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

  static String releaseDate(String date) {
    String month, day, year;
    if (date.substring(5, 7) == "01") {
      month = "January";
    } else if (date.substring(5, 7) == "02") {
      month = "February";
    } else if (date.substring(5, 7) == "03") {
      month = "March";
    } else if (date.substring(5, 7) == "04") {
      month = "April";
    } else if (date.substring(5, 7) == "05") {
      month = "May";
    } else if (date.substring(5, 7) == "06") {
      month = "June";
    } else if (date.substring(5, 7) == "07") {
      month = "July";
    } else if (date.substring(5, 7) == "08") {
      month = "August";
    } else if (date.substring(5, 7) == "09") {
      month = "September";
    } else if (date.substring(5, 7) == "10") {
      month = "October";
    } else if (date.substring(5, 7) == "11") {
      month = "November";
    } else if (date.substring(5, 7) == "12") {
      month = "December";
    } else {
      month = "";
    }
    day = date.substring(8);
    year = date.substring(0, 4);
    return "${month} ${day}, ${year}";
  }
}