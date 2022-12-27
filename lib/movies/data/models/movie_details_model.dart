import 'package:movies/movies/data/models/genres_model.dart';
import 'package:movies/movies/domain/entites/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.id,
    required super.runTime,
    required super.overview,
    required super.releaseDate,
    required super.genres,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          backdropPath: json['backdrop_path'],
          id: json['id'],
          runTime: json['run_time'],
          overview: json['overview'],
          releaseDate: json['release_date'],
          genres: List<GenresModel>.from(
              json['genres'].map((e) => GenresModel.fromJson(e))),
          title: json['title'],
          voteAverage: json['vote_average'].toDouble());
}
