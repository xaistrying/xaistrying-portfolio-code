// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/extension/context_extension.dart';
import '../../../app/theme/app_color.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.getLightDark(context, reverse: true),
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
      ),
      child: ListView(
        cacheExtent: 10000,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () => Scaffold.of(context).closeDrawer(),
              style: IconButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
                overlayColor: Colors.transparent,
              ),
              icon: Icon(
                Icons.close_rounded,
                color: AppColor.getLightDark(context),
                size: 28,
              ),
            ),
          ),
          _customItemDrawer(
            context,
            onTap: () => navigationShell.goBranch(0),
            text: context.loc.myPortfolio,
          ),
          _customItemDrawer(
            context,
            onTap: () => navigationShell.goBranch(1),
            text: context.loc.blog,
          ),
          _customItemDrawer(
            context,
            onTap: () => navigationShell.goBranch(2),
            text: context.loc.contact,
          ),
        ],
      ),
    );
  }

  Widget _customItemDrawer(
    BuildContext context, {
    required Function() onTap,
    required String text,
  }) => ListTile(
    onTap: () {
      context.pop();
      onTap.call();
    },
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    title: Text(
      text,
      style: TextStyle(fontSize: 20, color: AppColor.getWhiteBlack(context)),
    ),
  );
}
