import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failier.dart';
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class GetTopRatedMovieUseCase {
  BaseMovieRepository baseMovieRepository;

  GetTopRatedMovieUseCase(this.baseMovieRepository);

  Future<Either<Failer, List<Movie>>> execute() async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}
