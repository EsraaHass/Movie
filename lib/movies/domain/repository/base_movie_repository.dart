import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failier.dart';
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/entites/movie_details.dart';
import 'package:movies/movies/domain/entites/recommended.dart';
import 'package:movies/movies/domain/use_cases/get_movie_details_usecase.dart';
import 'package:movies/movies/domain/use_cases/get_movie_recommended_usecase.dart';

abstract class BaseMovieRepository {
  Future<Either<Failer, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failer, List<Movie>>> getPopularMovies();

  Future<Either<Failer, List<Movie>>> getTopRatedMovies();

  Future<Either<Failer, MovieDetails>> getMovieDetails(
      MovieDetailsParameter parameter);

  Future<Either<Failer, List<Recommendation>>> getRecommended(
      RecommendationParameter parameter);
}
