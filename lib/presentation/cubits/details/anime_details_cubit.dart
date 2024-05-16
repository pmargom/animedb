import 'package:animedb/domain/entities/api_response_entity.dart';
import 'package:animedb/domain/use_cases/get_anime_details_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'anime_details_state.dart';

class AnimeDetailsCubit extends Cubit<AnimeDetailsState> {
  final GetAnimeDetailsUsecase _getAnimeDetailsUsecase;

  AnimeDetailsCubit(this._getAnimeDetailsUsecase) : super(AnimeDetailsInitial());

  Future<void> getAnime(int id) async {
    emit(AnimeDetailsLoading());
    final failureOrData = await _getAnimeDetailsUsecase(id);
    failureOrData.fold(
      (failure) => emit(AnimeDetailsError(failure.toString())),
      (data) {
        emit(AnimeDetailsLoaded(data));
      },
    );
  }
}
