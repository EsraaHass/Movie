import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/core/error/exception.dart';
import 'package:movies/core/network/erroe_messege_model.dart';
import 'package:movies/core/utils/app_constance.dart';
import 'package:movies/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    var url = Uri.https(AppConstance.baseUrl, '/movie/now_playing',
        {'api_key': AppConstance.apiKey});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body);
      List<MovieModel> movies =
          body.map((e) => MovieModel.fromJson(e)).toList();

      return movies;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(
              (response.body) as Map<String, dynamic>));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    var url = Uri.https(AppConstance.baseUrl, '/movie/popular',
        {'api_key': AppConstance.apiKey});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body);
      List<MovieModel> movies =
          body.map((e) => MovieModel.fromJson(e)).toList();

      return movies;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(
              (response.body) as Map<String, dynamic>));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    var url = Uri.https(AppConstance.baseUrl, '/movie/top_rated',
        {'api_key': AppConstance.apiKey});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body);
      List<MovieModel> movies =
          body.map((e) => MovieModel.fromJson(e)).toList();

      return movies;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(
              (response.body) as Map<String, dynamic>));
    }
  }
}
