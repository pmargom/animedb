import 'package:animedb/domain/entities/api_response_entity.dart';

class ApiResponse {
  Pagination pagination;
  List<AnimeItem> data;

  ApiResponse({
    required this.pagination,
    required this.data,
  });

  ApiResponse copyWith({
    Pagination? pagination,
    List<AnimeItem>? data,
  }) =>
      ApiResponse(
        pagination: pagination ?? this.pagination,
        data: data ?? this.data,
      );
}

class AnimeItem {
  int malId;
  String url;
  String imageUrl;
  String title;
  String titleEnglish;
  String type;
  String source;
  int episodes;
  String duration;
  String rating;
  double score;
  int scoredBy;
  int rank;
  int popularity;
  int members;
  int favorites;
  String synopsis;
  String background;
  String season;
  int? year;

  AnimeItem({
    required this.malId,
    required this.url,
    required this.imageUrl,
    required this.title,
    required this.titleEnglish,
    required this.type,
    required this.source,
    required this.episodes,
    required this.duration,
    required this.rating,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.season,
    required this.year,
  });

  AnimeItem copyWith({
    int? malId,
    String? url,
    String? imageUrl,
    String? title,
    dynamic titleEnglish,
    String? type,
    String? source,
    int? episodes,
    String? duration,
    String? rating,
    double? score,
    int? scoredBy,
    int? rank,
    int? popularity,
    int? members,
    int? favorites,
    String? synopsis,
    dynamic background,
    String? season,
    int? year,
  }) =>
      AnimeItem(
        malId: malId ?? this.malId,
        url: url ?? this.url,
        imageUrl: imageUrl ?? this.imageUrl,
        title: title ?? this.title,
        titleEnglish: titleEnglish ?? this.titleEnglish,
        type: type ?? this.type,
        source: source ?? this.source,
        episodes: episodes ?? this.episodes,
        duration: duration ?? this.duration,
        rating: rating ?? this.rating,
        score: score ?? this.score,
        scoredBy: scoredBy ?? this.scoredBy,
        rank: rank ?? this.rank,
        popularity: popularity ?? this.popularity,
        members: members ?? this.members,
        favorites: favorites ?? this.favorites,
        synopsis: synopsis ?? this.synopsis,
        background: background ?? this.background,
        season: season ?? this.season,
        year: year ?? this.year,
      );

  static AnimeItem fromJson(json) {
    return AnimeItem(
      malId: json["mal_id"],
      url: json["url"],
      title: json["title"] ?? "",
      imageUrl: json["images"]["jpg"]["image_url"] ?? "",
      titleEnglish: json["title_english"] ?? "",
      type: json["type"] ?? "",
      source: json["source"] ?? "",
      episodes: json["episodes"] ?? 0,
      duration: json["duration"] ?? "",
      rating: json["rating"] ?? "",
      score: (json["score"] as num).toDouble(),
      scoredBy: json["scored_by"] ?? 0,
      rank: json["rank"] ?? 0,
      popularity: json["popularity"] ?? 0,
      members: json["members"] ?? 0,
      favorites: json["favorites"] ?? 0,
      synopsis: json["synopsis"] ?? "",
      background: json["background"] ?? "",
      season: json["season"] ?? "",
      year: json["year"],
    );
  }

  static List<AnimeItem> fromJsonList(List json) => List<AnimeItem>.from(json.map((json) => AnimeItem.fromJson(json)));
}

class Pagination {
  int lastVisiblePage;
  bool hasNextPage;
  int currentPage;
  Items items;

  Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });

  Pagination copyWith({
    int? lastVisiblePage,
    bool? hasNextPage,
    int? currentPage,
    Items? items,
  }) =>
      Pagination(
        lastVisiblePage: lastVisiblePage ?? this.lastVisiblePage,
        hasNextPage: hasNextPage ?? this.hasNextPage,
        currentPage: currentPage ?? this.currentPage,
        items: items ?? this.items,
      );
}

class Items {
  int count;
  int total;
  int perPage;

  Items({
    required this.count,
    required this.total,
    required this.perPage,
  });

  Items copyWith({
    int? count,
    int? total,
    int? perPage,
  }) =>
      Items(
        count: count ?? this.count,
        total: total ?? this.total,
        perPage: perPage ?? this.perPage,
      );
}

extension AnimeItemExtension on AnimeItem {
  AnimeItemEntity get asEntity => AnimeItemEntity(
        malId: malId,
        url: url,
        imagesUrl: imageUrl,
        title: title,
        titleEnglish: titleEnglish,
        type: type,
        source: source,
        episodes: episodes,
        duration: duration,
        rating: rating,
        score: score,
        scoredBy: scoredBy,
        rank: rank,
        popularity: popularity,
        members: members,
        favorites: favorites,
        synopsis: synopsis,
        background: background,
        season: season,
        year: year,
      );
}
