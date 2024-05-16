part of 'anime_details_cubit.dart';

abstract class AnimeDetailsState {}

class AnimeDetailsInitial extends AnimeDetailsState {}

class AnimeDetailsLoading extends AnimeDetailsState {}

class AnimeDetailsLoaded extends AnimeDetailsState {
  final AnimeItemEntity? animes;

  AnimeDetailsLoaded(this.animes);
}

class AnimeDetailsError extends AnimeDetailsState {
  final String message;

  AnimeDetailsError(this.message);
}
