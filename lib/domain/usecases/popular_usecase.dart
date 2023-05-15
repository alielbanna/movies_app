import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repository/repository.dart';

class PopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final Repository baseMoviesRepository;

  PopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
