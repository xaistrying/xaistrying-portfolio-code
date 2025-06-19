// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:xaistrying_portfolio/presentation/blog/blog_screen.dart';
import 'package:xaistrying_portfolio/presentation/contact/contact_screen.dart';
import 'package:xaistrying_portfolio/presentation/my_portfolio/my_portfolio_screen.dart';
import 'package:xaistrying_portfolio/presentation/nav/nav_screen.dart';
import '../../presentation/nav/nav_shell_provider.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

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
            (context, state, navigationShell) => NavigationShellProvider(
              navigationShell: navigationShell,
              child: NavScreen(navigationShell: navigationShell),
            ),
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
