import 'package:get_it/get_it.dart';
import 'package:movies_app/data/datasource/remote_data_source.dart';
import 'package:movies_app/data/repository/repository_impl.dart';
import 'package:movies_app/domain/repository/repository.dart';
import 'package:movies_app/domain/usecases/movie_details_usecase.dart';
import 'package:movies_app/domain/usecases/now_playing_usecase.dart';
import 'package:movies_app/domain/usecases/popular_usecase.dart';
import 'package:movies_app/domain/usecases/recommendation_usecase.dart';
import 'package:movies_app/domain/usecases/top_rated_usecase.dart';
import 'package:movies_app/presentation/controller/movie_details_bloc.dart';
import 'package:movies_app/presentation/controller/movies_bloc.dart';

final instance = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    instance
        .registerFactory(() => MoviesBloc(instance(), instance(), instance()));
    instance.registerFactory(() => MovieDetailsBloc(instance(), instance()));

    /// Use Cases
    instance.registerLazySingleton(() => NowPlayingMoviesUseCase(instance()));
    instance.registerLazySingleton(() => PopularMoviesUseCase(instance()));
    instance.registerLazySingleton(() => TopRatedMoviesUseCase(instance()));
    instance.registerLazySingleton(() => MovieDetailsUseCase(instance()));
    instance.registerLazySingleton(() => RecommendationUseCase(instance()));

    /// Repository
    instance
        .registerLazySingleton<Repository>(() => RepositoryImpl(instance()));

    /// DATA SOURCE
    instance
        .registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());
  }
}
