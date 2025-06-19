// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

class NavigationShellProvider extends InheritedWidget {
  final StatefulNavigationShell navigationShell;

  const NavigationShellProvider({
    super.key,
    required this.navigationShell,
    required super.child,
  });

  static StatefulNavigationShell of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<NavigationShellProvider>();
    assert(result != null, 'No NavigationShellProvider found in context');
    return result!.navigationShell;
  }

  @override
  bool updateShouldNotify(covariant NavigationShellProvider oldWidget) {
    return oldWidget.navigationShell != navigationShell;
  }
}
