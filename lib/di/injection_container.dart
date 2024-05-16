import 'package:animedb/core/network/services_base_api.dart';
import 'package:animedb/data/datasources/remote_datasource.dart';
import 'package:animedb/data/repositories/anime_repository_impl.dart';
import 'package:animedb/domain/repositories/anime_repository.dart';
import 'package:animedb/domain/use_cases/get_anime_details_usecase.dart';
import 'package:animedb/domain/use_cases/get_animes_usecase.dart';
import 'package:animedb/presentation/cubits/animes/animes_cubit.dart';
import 'package:animedb/presentation/cubits/details/anime_details_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initDependencies() {
  // Bloc
  getIt.registerFactory(() => AnimesCubit(getIt()));
  getIt.registerFactory(() => AnimeDetailsCubit(getIt()));
  // Use cases
  getIt.registerLazySingleton(() => GetAnimesUsecase(getIt()));
  getIt.registerLazySingleton(() => GetAnimeDetailsUsecase(getIt()));
  // Repositories
  getIt.registerLazySingleton<AnimeRepository>(() => AnimeRepositoryImpl(getIt()));
  // Data sources
  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(getIt()));
  // Api service
  getIt.registerLazySingleton(() => ServicesBaseApi());
}
