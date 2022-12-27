import 'package:bloc/bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/use_cases/get_movie_details_usecase.dart';
import 'package:movies/movies/presentation/controller/movie_details_event.dart';
import 'package:movies/movies/presentation/controller/movie_details_state.dart';

import '../../domain/use_cases/get_movie_recommended_usecase.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendedUseCase getMovieRecommendedUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getMovieRecommendedUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      final result =
          await getMovieDetailsUseCase(MovieDetailsParameter(event.id));
      result.fold(
          (l) => emit(state.copyWith(
              movieDetailsState: RequestState.isError,
              movieDetailsMessage: l.message)),
          (r) => emit(state.copyWith(
              movieDetailsState: RequestState.isLoaded, movieDetails: r)));
    });

    on<GetMovieRecommendedEvent>((event, emit) async {
      final result =
          await getMovieRecommendedUseCase(RecommendationParameter(event.id));
      result.fold(
          (l) => emit(state.copyWith(
              movieRecomendedState: RequestState.isError,
              movieRecomendedMessage: l.message)),
          (r) => emit(state.copyWith(
              movieRecomendedState: RequestState.isLoaded,
              movieRecomended: r)));
    });
  }
}
