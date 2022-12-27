import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/entites/movie_details.dart';
import 'package:movies/movies/domain/entites/recommended.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<Recommendation> movieRecomended;
  final RequestState movieRecomendedState;
  final String movieRecomendedMessage;

  const MovieDetailsState(
      {this.movieDetails,
      this.movieDetailsState = RequestState.isLoading,
      this.movieDetailsMessage = '',
      this.movieRecomended = const [],
      this.movieRecomendedState = RequestState.isLoading,
      this.movieRecomendedMessage = ''});

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? movieRecomended,
    RequestState? movieRecomendedState,
    String? movieRecomendedMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieRecomended: movieRecomended ?? this.movieRecomended,
      movieRecomendedState: movieRecomendedState ?? this.movieRecomendedState,
      movieRecomendedMessage:
          movieRecomendedMessage ?? this.movieRecomendedMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        movieRecomended,
        movieRecomendedState,
        movieRecomendedMessage
      ];
}
