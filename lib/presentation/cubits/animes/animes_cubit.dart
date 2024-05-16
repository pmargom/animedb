import 'package:animedb/domain/entities/api_response_entity.dart';
import 'package:animedb/domain/use_cases/get_animes_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'animes_state.dart';

class AnimesCubit extends Cubit<AnimesState> {
  final GetAnimesUsecase _getAnimesUsecase;

  AnimesCubit(this._getAnimesUsecase) : super(AnimesInitial());

  Future<void> getAnimes([page = 1]) async {
    emit(AnimesLoading());
    final failureOrData = await _getAnimesUsecase(page);
    failureOrData.fold(
      (failure) => emit(AnimesError(failure.toString())),
      (data) {
        emit(AnimesLoaded(data));
      },
    );
  }
}
