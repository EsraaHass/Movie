import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies/movies/data/repository/movie_repository.dart';
import 'package:movies/movies/domain/repository/base_movie_repository.dart';
import 'package:movies/movies/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:movies/movies/domain/use_cases/get_popular_movie_usecase.dart';
import 'package:movies/movies/domain/use_cases/get_top_rated_movies+usecase.dart';
import 'package:movies/movies/presentation/controller/movie_bloc.dart';

GetIt sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    /// MOVIE REPOSITORY
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    /// USE CASE
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMovieUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMovieUseCase(sl()));

    /// BLOC
    sl.registerFactory(() => MovieBloc(sl(), sl(), sl()));
  }
}
