import 'package:animedb/core/network/services_base_api.dart';
import 'package:animedb/features/home/data/datasources/remote_datasource.dart';
import 'package:animedb/features/home/data/repositories/anime_repository_impl.dart';
import 'package:animedb/features/home/domain/repositories/anime_repository.dart';
import 'package:animedb/features/home/domain/use_cases/get_animes_usecase.dart';
import 'package:animedb/features/home/presentation/cubits/animes/animes_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initDependencies() {
  // Bloc
  getIt.registerFactory(() => AnimesCubit(getIt()));
  // Use cases
  getIt.registerLazySingleton(() => GetAnimesUsecase(getIt()));
  // Repositories
  getIt.registerLazySingleton<AnimeRepository>(() => AnimeRepositoryImpl(getIt()));
  // Data sources
  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(getIt()));
  // Api service
  getIt.registerLazySingleton(() => ServicesBaseApi());
}
