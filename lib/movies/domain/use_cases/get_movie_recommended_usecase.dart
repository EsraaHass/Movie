import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failier.dart';
import 'package:movies/core/use_case/base_usecase.dart';
import 'package:movies/movies/domain/entites/recommended.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';

class GetMovieRecommendedUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameter> {
  BaseMovieRepository baseMovieRepository;

  GetMovieRecommendedUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failer, List<Recommendation>>> call(
      RecommendationParameter parameter) async {
    return await baseMovieRepository.getRecommended(parameter);
  }
}

class RecommendationParameter extends Equatable {
  final int movieId;

  const RecommendationParameter(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
