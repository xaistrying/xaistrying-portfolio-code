// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

// Project imports:
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
        shape: Border(
          bottom: BorderSide(color: AppColor.getWhiteBlack(context), width: 2),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 40,
            children: [
              NavButtonWidget(
                onPressed: () => navigationShell.goBranch(0),
                isCurrentScreen: navigationShell.currentIndex == 0,
                text: context.loc.myPortfolio,
              ),
              NavButtonWidget(
                onPressed: () => navigationShell.goBranch(1),
                isCurrentScreen: navigationShell.currentIndex == 1,
                text: context.loc.blog,
              ),
              NavButtonWidget(
                onPressed: () => navigationShell.goBranch(2),
                isCurrentScreen: navigationShell.currentIndex == 2,
                text: context.loc.contact,
              ),
              Spacer(),

              // Language Menu
              Directionality(
                textDirection: TextDirection.rtl,
                child: MenuAnchor(
                  alignmentOffset: Offset(-12, 8),
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
                  style: MenuStyle(
                    elevation: WidgetStatePropertyAll(
                      context.isDarkMode ? 0 : 4,
                    ),
                  ),
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
                                backgroundColor: AppColor.getWhiteLightBlack(
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

              // Dark/Light Mode
              IconButton(
                onPressed:
                    () =>
                        context.read<AppConfigCubit>().updateThemeMode(context),
                style: IconButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: Colors.transparent,
                ),
                icon:
                    context.isDarkMode
                        ? SvgPicture.asset(
                          'asset/icon/moon_line.svg',
                          colorFilter: const ColorFilter.mode(
                            AppColor.white,
                            BlendMode.srcIn,
                          ),
                        )
                        : SvgPicture.asset(
                          'asset/icon/sun_line.svg',
                          colorFilter: const ColorFilter.mode(
                            AppColor.black,
                            BlendMode.srcIn,
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
      body: navigationShell,
    );
  }
}
