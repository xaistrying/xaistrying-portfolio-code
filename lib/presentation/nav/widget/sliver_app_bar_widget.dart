// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../app/theme/app_color.dart';
import '../../../app/util/screen_helper.dart';
import '../layout/app_bar_function_mobile_layout.dart';
import '../layout/app_bar_function_tablet_layout.dart';
import '../layout/app_bar_functions_desktop_layout.dart';
import '../nav_shell_provider.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationShell = NavigationShellProvider.of(context);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      pinned: false,
      floating: false,
      shape: Border(
        bottom: BorderSide(color: AppColor.getWhiteBlack(context), width: 2),
      ),
      title: ScreenHelper(
        desktopBody: AppBarFunctionsDesktopLayout(
          navigationShell: navigationShell,
        ),
        tabletBody: AppBarFunctionsTabletLayout(
          navigationShell: navigationShell,
        ),
        mobileBody: AppBarFunctionMobileLayout(
          navigationShell: navigationShell,
        ),
      ),
    );
  }
}
