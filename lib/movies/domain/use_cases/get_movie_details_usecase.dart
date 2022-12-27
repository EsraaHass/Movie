import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failier.dart';
import 'package:movies/core/use_case/base_usecase.dart';
import 'package:movies/movies/domain/entites/movie_details.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameter> {
  BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failer, MovieDetails>> call(
      MovieDetailsParameter parameter) async {
    return await baseMovieRepository.getMovieDetails(parameter);
  }
}

class MovieDetailsParameter extends Equatable {
  final int movieId;

  const MovieDetailsParameter(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
