import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/use_case/base_usecase.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/use_cases/get_popular_movie_usecase.dart';
import 'package:movies/movies/domain/use_cases/get_top_rated_movies+usecase.dart';
import 'package:movies/movies/presentation/controller/movie_event.dart';
import 'package:movies/movies/presentation/controller/movie_state.dart';

import '../../domain/use_cases/get_now_playing_movies_usecase.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetTopRatedMovieUseCase getTopRatedMovieUseCase;

  MovieBloc(this.getNowPlayingUseCase, this.getPopularMovieUseCase,
      this.getTopRatedMovieUseCase)
      : super(const MovieState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingUseCase(const NoParameter());
      result.fold(
          (l) => emit(state.copyWith(
              nowPlayingState: RequestState.isError,
              nowPlayingMessage: l.message)),
          (r) => emit(state.copyWith(
              nowPlayingState: RequestState.isLoaded, nowPlayingMovie: r)));
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMovieUseCase(const NoParameter());
      result.fold(
          (l) => emit(state.copyWith(
              popularState: RequestState.isError, popularMessage: l.message)),
          (r) => emit(state.copyWith(
              popularState: RequestState.isLoaded, popularMovie: r)));
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMovieUseCase(const NoParameter());
      result.fold(
          (l) => emit(state.copyWith(
              topRatedState: RequestState.isError, topRatedMessage: l.message)),
          (r) => emit(state.copyWith(
              topRatedState: RequestState.isLoaded, topRatedMovie: r)));
    });
  }
}
