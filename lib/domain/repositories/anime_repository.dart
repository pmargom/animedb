import 'package:animedb/core/errors/server_failure.dart';
import 'package:animedb/domain/entities/api_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeRepository {
  Future<Either<Failure, List<AnimeItemEntity>>> getAnimes([int page = 1]);
  Future<Either<Failure, AnimeItemEntity?>> getAnime(int id);
}
