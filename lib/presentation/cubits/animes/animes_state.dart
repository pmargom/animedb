part of 'animes_cubit.dart';

abstract class AnimesState {}

class AnimesInitial extends AnimesState {}

class AnimesLoading extends AnimesState {}

class AnimesLoaded extends AnimesState {
  final List<AnimeItemEntity> animes;

  AnimesLoaded(this.animes);
}

class AnimesError extends AnimesState {
  final String message;

  AnimesError(this.message);
}
