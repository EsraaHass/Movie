import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final String title;
  final String releaseDate;
  final double voteAverage;

  const Movie(
      {required this.id,
      required this.backdropPath,
      required this.genreIds,
      required this.overview,
      required this.title,
      required this.releaseDate,
      required this.voteAverage});

  @override
  List<Object> get props =>
      [id, backdropPath, genreIds, overview, title, releaseDate, voteAverage];
}
