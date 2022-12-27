import 'package:equatable/equatable.dart';
import 'package:movies/movies/domain/entites/genres.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final int id;
  final int? runTime;
  final String overview;
  final String releaseDate;
  final List<Genres> genres;

  final String title;
  final double voteAverage;

  const MovieDetails({
    required this.backdropPath,
    required this.id,
    required this.runTime,
    required this.overview,
    required this.releaseDate,
    required this.genres,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        runTime,
        overview,
        releaseDate,
        genres,
        title,
        voteAverage,
      ];
}
