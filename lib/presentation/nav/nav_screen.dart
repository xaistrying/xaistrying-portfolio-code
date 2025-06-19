// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/router/app_router.dart';
import '../../app/util/screen_helper.dart';
import 'widget/drawer_widget.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   scrolledUnderElevation: 0,
      //   shape: Border(
      //     bottom: BorderSide(color: AppColor.getWhiteBlack(context), width: 2),
      //   ),
      //   title: ScreenHelper(
      //     desktopBody: AppBarFunctionsDesktopLayout(
      //       navigationShell: navigationShell,
      //     ),
      //     tabletBody: AppBarFunctionsTabletLayout(
      //       navigationShell: navigationShell,
      //     ),
      //     mobileBody: AppBarFunctionMobileLayout(
      //       navigationShell: navigationShell,
      //     ),
      //   ),
      // ),
      drawer: ScreenHelper(
        tabletBody: DrawerWidget(navigationShell: navigationShell),
        mobileBody: DrawerWidget(navigationShell: navigationShell),
      ),
      body: navigationShell,
    );
  }
}
