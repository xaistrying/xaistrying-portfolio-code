import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:xaistrying_portfolio/app/bloc/app_config/app_config_cubit.dart';
import 'package:xaistrying_portfolio/app/constant/language_constant.dart';
import 'package:xaistrying_portfolio/app/extension/context_extension.dart';
import 'package:xaistrying_portfolio/app/theme/app_color.dart';
import 'package:xaistrying_portfolio/presentation/nav/widget/nav_button_widget.dart';

import '../../app/l10n/generated/app_localizations.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 40,
            children: [
              NavButtonWidget(
                onPressed: () => navigationShell.goBranch(0),
                text: context.loc.myPortfolio,
              ),
              NavButtonWidget(
                onPressed: () => navigationShell.goBranch(1),
                text: context.loc.blog,
              ),
              NavButtonWidget(
                onPressed: () => navigationShell.goBranch(2),
                text: context.loc.contact,
              ),
              Spacer(),
              Directionality(
                textDirection: TextDirection.rtl,
                child: MenuAnchor(
                  builder: (
                    BuildContext context,
                    MenuController controller,
                    Widget? child,
                  ) {
                    return TextButton(
                      onPressed: () {
                        if (controller.isOpen) {
                          controller.close();
                        } else {
                          controller.open();
                        }
                      },
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                        overlayColor: Colors.transparent,
                      ),
                      child: BlocBuilder<AppConfigCubit, AppConfigState>(
                        builder: (context, state) {
                          return Text(
                            getLanguage(state.data.locale?.languageCode),
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColor.getWhiteBlack(context),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  menuChildren:
                      AppLocalizations.supportedLocales
                          .map(
                            (locale) => MenuItemButton(
                              onPressed:
                                  () => context
                                      .read<AppConfigCubit>()
                                      .updateLocale(locale),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 20,
                                ),
                                backgroundColor: AppColor.getWhiteBlack(
                                  context,
                                  reverse: true,
                                ),
                              ),
                              child: Text(
                                getLanguage(locale.languageCode),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColor.getWhiteBlack(context),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
              IconButton(
                onPressed:
                    () =>
                        context.read<AppConfigCubit>().updateThemeMode(context),
                style: IconButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: Colors.transparent,
                ),
                icon:
                    context.isDarkMode
                        ? Icon(MingCute.moon_fill)
                        : Icon(MingCute.moon_line),
              ),
            ],
          ),
        ),
      ),
      body: navigationShell,
    );
  }
}
