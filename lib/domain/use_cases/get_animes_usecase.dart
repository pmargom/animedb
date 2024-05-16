import 'package:animedb/core/errors/server_failure.dart';
import 'package:animedb/domain/entities/api_response_entity.dart';
import 'package:animedb/domain/repositories/anime_repository.dart';
import 'package:dartz/dartz.dart';

class GetAnimesUsecase {
  final AnimeRepository _repository;

  GetAnimesUsecase(this._repository);

  Future<Either<Failure, List<AnimeItemEntity>>> call([page = 1]) async {
    return await _repository.getAnimes(page);
  }
}
