import 'package:animedb/core/errors/server_failure.dart';
import 'package:animedb/features/home/domain/entities/api_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeRepository {
  Future<Either<Failure, List<AnimeItemEntity>>> getAnimeItems([int page = 1]);
}
