import 'package:dio/dio.dart';
import 'package:movies/core/error/exception.dart';
import 'package:movies/core/network/api_constant.dart';
import 'package:movies/core/network/erroe_messege_model.dart';
import 'package:movies/movies/data/models/movie_details_model.dart';
import 'package:movies/movies/data/models/movie_model.dart';
import 'package:movies/movies/data/models/recommendation_model.dart';
import 'package:movies/movies/domain/use_cases/get_movie_details_usecase.dart';
import 'package:movies/movies/domain/use_cases/get_movie_recommended_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<MovieDetailsModel> getMoviesDetails(MovieDetailsParameter parameter);

  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameter parameter);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson((response.data)));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson((response.data)));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson((response.data)));
    }
  }

  @override
  Future<MovieDetailsModel> getMoviesDetails(
      MovieDetailsParameter parameter) async {
    final response =
        await Dio().get(ApiConstance.MoviesDetailsPath(parameter.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson((response.data)));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameter parameter) async {
    final response =
        await Dio().get(ApiConstance.RecommendedMoviesPath(parameter.movieId));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson((response.data)));
    }
  }
}
