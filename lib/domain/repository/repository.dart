import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/entities/movie_detail.dart';
import 'package:movies_app/domain/entities/recommendation.dart';
import 'package:movies_app/domain/usecases/movie_details_usecase.dart';
import 'package:movies_app/domain/usecases/recommendation_usecase.dart';

abstract class Repository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters);
}
