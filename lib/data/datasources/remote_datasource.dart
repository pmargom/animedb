import 'package:animedb/core/errors/server_exception.dart';
import 'package:animedb/core/network/services_base_api.dart';
import 'package:animedb/data/models/api_response_model.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<List<AnimeItem>> getAnimes([int page = 1]);
  Future<AnimeItem?> getAnime(int id);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ServicesBaseApi _serviceBaseApi;

  RemoteDataSourceImpl(this._serviceBaseApi);

  @override
  Future<List<AnimeItem>> getAnimes([int page = 1]) async {
    List<AnimeItem> animeItemList = [];
    final queryParameters = {"page": page};
    try {
      Response? response = await _serviceBaseApi.get("anime", queryParameters: queryParameters);

      if (response != null) {
        animeItemList = AnimeItem.fromJsonList(response.data["data"]);
        return animeItemList;
      }
    } catch (e) {
      throw ServerException();
    }

    return animeItemList;
  }

  @override
  Future<AnimeItem?> getAnime(int id) async {
    AnimeItem? anime;
    try {
      Response? response = await _serviceBaseApi.get("anime/$id", queryParameters: {});

      if (response != null) {
        anime = AnimeItem.fromJson(response.data["data"]);
      }
    } catch (e) {
      throw ServerException();
    }

    return anime;
  }
}
