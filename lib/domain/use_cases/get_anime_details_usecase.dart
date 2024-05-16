import 'package:animedb/core/errors/server_failure.dart';
import 'package:animedb/domain/entities/api_response_entity.dart';
import 'package:animedb/domain/repositories/anime_repository.dart';
import 'package:dartz/dartz.dart';

class GetAnimeDetailsUsecase {
  final AnimeRepository _repository;

  GetAnimeDetailsUsecase(this._repository);

  Future<Either<Failure, AnimeItemEntity?>> call(int id) async {
    return await _repository.getAnime(id);
  }
}
