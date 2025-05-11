// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/theme/app_color.dart';
import 'package:xaistrying_portfolio/presentation/nav/widget/full_function_widget.dart';
import 'package:xaistrying_portfolio/presentation/nav/widget/shorten_function_widget.dart';
import 'package:xaistrying_portfolio/presentation/responsive/responsive_layout.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        shape: Border(
          bottom: BorderSide(color: AppColor.getWhiteBlack(context), width: 2),
        ),
        title: ResponsiveLayout(
          desktopBody: FullFunctionWidget(navigationShell: navigationShell),
          tabletBody: FullFunctionWidget(navigationShell: navigationShell),
          verTabletBody: ShortenFunctionWidget(
            navigationShell: navigationShell,
          ),
        ),
      ),
      body: navigationShell,
    );
  }
}
