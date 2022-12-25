import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failier.dart';
import 'package:movies/movies/domain/entites/movie.dart';

abstract class BaseMovieRepository {
  Future<Either<Failer, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failer, List<Movie>>> getPopularMovies();

  Future<Either<Failer, List<Movie>>> getTopRatedMovies();
}
