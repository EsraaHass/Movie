import 'package:movies/movies/domain/entites/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.backdropPath,
      required super.genreIds,
      required super.overview,
      required super.title,
      required super.releaseDate,
      required super.voteAverage});

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'],
      title: json['title'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble());
}
