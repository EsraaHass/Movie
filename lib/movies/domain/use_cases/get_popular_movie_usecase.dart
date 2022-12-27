import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failier.dart';
import 'package:movies/core/use_case/base_usecase.dart';
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class GetPopularMovieUseCase extends BaseUseCase<List<Movie>, NoParameter> {
  BaseMovieRepository baseMovieRepository;

  GetPopularMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failer, List<Movie>>> call(NoParameter noParameter) async {
    return await baseMovieRepository.getPopularMovies();
  }
}
