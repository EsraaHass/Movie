import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exception.dart';
import 'package:movies/core/error/failier.dart';
import 'package:movies/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failer, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failer) {
      return Left(ServerFailer(failer.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failer, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failer) {
      return Left(ServerFailer(failer.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failer, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failer) {
      return Left(ServerFailer(failer.errorMessageModel.statusMessage));
    }
  }
}
