import 'package:go_router/go_router.dart';
import 'package:xaistrying_portfolio/presentation/blog/blog_screen.dart';
import 'package:xaistrying_portfolio/presentation/contact/contact_screen.dart';
import 'package:xaistrying_portfolio/presentation/my_portfolio/my_portfolio_screen.dart';
import 'package:xaistrying_portfolio/presentation/nav/nav_screen.dart';

class AppRouter {
  AppRouter._();

  static final String myPortfolio = '/myPortfolio';
  static final String blog = '/blog';
  static final String contact = '/contact';

  static final GoRouter _router = GoRouter(
    initialLocation: myPortfolio,
    routes: [
      StatefulShellRoute.indexedStack(
        builder:
            (context, state, navigationShell) =>
                NavScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: myPortfolio,
                builder: (context, state) => const MyPortfolioScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: blog, builder: (context, state) => BlogScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: contact,
                builder: (context, state) => ContactScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
