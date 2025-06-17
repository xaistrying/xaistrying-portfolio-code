// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/constant/image_constant.dart';
import 'package:xaistrying_portfolio/app/extension/context_extension.dart';
import 'package:xaistrying_portfolio/app/extension/string_extension.dart';
import '../../../app/bloc/app_config/app_config_cubit.dart';
import '../../../app/constant/language_constant.dart';
import '../../../app/l10n/generated/app_localizations.dart';
import '../../../app/theme/app_color.dart';

class AppBarFunctionMobileLayout extends StatelessWidget {
  const AppBarFunctionMobileLayout({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            constraints: BoxConstraints(),
            style: IconButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              overlayColor: Colors.transparent,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            icon: SvgPicture.asset(
              ImageConstant.menu,
              colorFilter: ColorFilter.mode(
                AppColor.getWhiteBlack(context),
                BlendMode.srcIn,
              ),
            ),
          ),
          Text(
            getScreenTitle(
              context,
              index: navigationShell.currentIndex,
            ).toCapitalized,
            style: TextStyle(
              fontSize: 20,
              color: AppColor.getWhiteBlack(context),
            ),
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
                        state.data.locale?.languageCode.toCapitalized ?? '',
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
                elevation: WidgetStatePropertyAll(context.isDarkMode ? 0 : 4),
              ),
              menuChildren:
                  AppLocalizations.supportedLocales
                      .map(
                        (locale) => MenuItemButton(
                          onPressed:
                              () => context.read<AppConfigCubit>().updateLocale(
                                locale,
                              ),
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
                () => context.read<AppConfigCubit>().updateThemeMode(context),
            style: IconButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              splashFactory: NoSplash.splashFactory,
              overlayColor: Colors.transparent,
            ),
            icon:
                context.isDarkMode
                    ? SvgPicture.asset(
                      ImageConstant.moon,
                      colorFilter: const ColorFilter.mode(
                        AppColor.white,
                        BlendMode.srcIn,
                      ),
                    )
                    : SvgPicture.asset(
                      ImageConstant.sun,
                      colorFilter: const ColorFilter.mode(
                        AppColor.black,
                        BlendMode.srcIn,
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
