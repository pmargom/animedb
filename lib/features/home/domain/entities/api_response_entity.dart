// class ApiResponseEntity {
//     Pagination pagination;
//     List<AnimeItem> data;

//     ApiResponseEntity({
//         required this.pagination,
//         required this.data,
//     });

//     ApiResponseEntity copyWith({
//         Pagination? pagination,
//         List<AnimeItem>? data,
//     }) =>
//         ApiResponseEntity(
//             pagination: pagination ?? this.pagination,
//             data: data ?? this.data,
//         );
// }

class AnimeItemEntity {
  int malId;
  String url;
  String imagesUrl;
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

  AnimeItemEntity({
    required this.malId,
    required this.url,
    required this.imagesUrl,
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

  AnimeItemEntity copyWith({
    int? malId,
    String? url,
    String? imagesUrl,
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
      AnimeItemEntity(
        malId: malId ?? this.malId,
        url: url ?? this.url,
        imagesUrl: imagesUrl ?? this.imagesUrl,
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
