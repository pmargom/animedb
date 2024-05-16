import 'package:animedb/core/errors/server_exception.dart';
import 'package:animedb/core/network/services_base_api.dart';
import 'package:animedb/features/home/data/models/api_response_model.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSource {
  Future<List<AnimeItem>> getAnimeItems([int page = 1]);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ServicesBaseApi _serviceBaseApi;

  RemoteDataSourceImpl(this._serviceBaseApi);

  @override
  Future<List<AnimeItem>> getAnimeItems([int page = 1]) async {
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
}
