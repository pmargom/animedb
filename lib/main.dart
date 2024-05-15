import 'package:animedb/core/config/app_router.dart';
import 'package:animedb/core/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: "Anime DB",
      theme: AppTheme(selectedColor: 4).getTheme(),
    );
  }
}
