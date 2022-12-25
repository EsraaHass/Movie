import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failier.dart';
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingUseCase {
  BaseMovieRepository baseMovieRepository;

  GetNowPlayingUseCase(this.baseMovieRepository);

  Future<Either<Failer, List<Movie>>> execute() async {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}
