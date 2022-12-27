import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failier.dart';
import 'package:movies/core/use_case/base_usecase.dart';
import 'package:movies/movies/domain/entites/movie.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class GetTopRatedMovieUseCase extends BaseUseCase<List<Movie>, NoParameter> {
  BaseMovieRepository baseMovieRepository;

  GetTopRatedMovieUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failer, List<Movie>>> call(NoParameter noParameter) async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}
