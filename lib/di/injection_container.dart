import 'package:animedb/core/network/services_base_api.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initDependencies() {
  // Bloc

  // Use cases

  // Repositories

  // Data sources

  // Api service
  getIt.registerLazySingleton(() => ServicesBaseApi());
}
