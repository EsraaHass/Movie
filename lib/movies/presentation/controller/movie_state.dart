import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/entites/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovie;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMovie;
  final RequestState popularState;
  final String popularMessage;
  final List<Movie> topRatedMovie;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MovieState({
    this.nowPlayingMovie = const [],
    this.nowPlayingState = RequestState.isLoading,
    this.nowPlayingMessage = '',
    this.popularMovie = const [],
    this.popularState = RequestState.isLoading,
    this.popularMessage = '',
    this.topRatedMovie = const [],
    this.topRatedState = RequestState.isLoading,
    this.topRatedMessage = '',
  });

  MovieState copyWith({
    List<Movie>? nowPlayingMovie,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMovie,
    RequestState? popularState,
    String? popularMessage,
    List<Movie>? topRatedMovie,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MovieState(
      nowPlayingMovie: nowPlayingMovie ?? this.nowPlayingMovie,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovie: popularMovie ?? this.popularMovie,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovie: topRatedMovie ?? this.topRatedMovie,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovie,
        nowPlayingState,
        nowPlayingMessage,
        popularMovie,
        popularState,
        popularMessage,
        topRatedMovie,
        topRatedState,
        topRatedMessage
      ];
}
