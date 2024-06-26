import 'package:animedb/core/config/app_router.dart';
import 'package:animedb/di/injection_container.dart';
import 'package:animedb/presentation/cubits/animes/animes_cubit.dart';
import 'package:animedb/presentation/cubits/details/anime_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<AnimesCubit>()),
        BlocProvider.value(value: getIt<AnimeDetailsCubit>()),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        title: "Anime DB",
      ),
    );
  }
}
