import 'package:animedb/core/errors/server_failure.dart';
import 'package:animedb/features/home/data/datasources/remote_datasource.dart';
import 'package:animedb/features/home/data/models/api_response_model.dart';
import 'package:animedb/features/home/domain/entities/api_response_entity.dart';
import 'package:animedb/features/home/domain/repositories/anime_repository.dart';
import 'package:dartz/dartz.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final RemoteDataSource _remoteDataSource;

  AnimeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<AnimeItemEntity>>> getAnimeItems([int page = 1]) async {
    try {
      final List<AnimeItem> animeItems = await _remoteDataSource.getAnimeItems(page);

      final List<AnimeItemEntity> animeEntities = animeItems.map((AnimeItem animeItem) => animeItem.asEntity).toList();
      return Right(animeEntities);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
