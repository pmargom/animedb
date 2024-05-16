import 'package:animedb/core/config/routes.dart';
import 'package:animedb/presentation/screens/details/details_screen.dart';
import 'package:animedb/presentation/screens/home/home_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: Routes.details,
      builder: (_, state) => DetailsScreen(goRouterState: state),
    ),
  ],
);
