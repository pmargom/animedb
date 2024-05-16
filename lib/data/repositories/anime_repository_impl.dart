import 'package:animedb/core/errors/server_failure.dart';
import 'package:animedb/data/datasources/remote_datasource.dart';
import 'package:animedb/data/models/api_response_model.dart';
import 'package:animedb/domain/entities/api_response_entity.dart';
import 'package:animedb/domain/repositories/anime_repository.dart';
import 'package:dartz/dartz.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final RemoteDataSource _remoteDataSource;

  AnimeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<AnimeItemEntity>>> getAnimes([int page = 1]) async {
    try {
      final List<AnimeItem> animeItems = await _remoteDataSource.getAnimes(page);

      final List<AnimeItemEntity> animeEntities = animeItems.map((AnimeItem animeItem) => animeItem.asEntity).toList();
      return Right(animeEntities);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AnimeItemEntity?>> getAnime(int id) async {
    try {
      final AnimeItem? anime = await _remoteDataSource.getAnime(id);

      final AnimeItemEntity? animeEntity = anime?.asEntity;
      return Right(animeEntity);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
