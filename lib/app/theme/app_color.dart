// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/extension/context_extension.dart';

class AppColor {
  AppColor._();

  static const ligthScaffold = Color.fromARGB(255, 246, 246, 246);
  static const darkScaffold = Color.fromARGB(255, 37, 37, 37);
  static const white = Color.fromARGB(255, 250, 250, 250);
  static const black = Color.fromARGB(255, 10, 10, 10);
  static const lightDark = Color.fromARGB(255, 60, 60, 60);

  static Color getWhiteBlack(BuildContext context, {bool? reverse}) {
    return reverse == true
        ? context.isDarkMode
            ? AppColor.black
            : AppColor.white
        : context.isDarkMode
        ? AppColor.white
        : AppColor.black;
  }

  static Color getWhiteLightBlack(BuildContext context, {bool? reverse}) {
    return reverse == true
        ? context.isDarkMode
            ? AppColor.lightDark
            : AppColor.white
        : context.isDarkMode
        ? AppColor.white
        : AppColor.lightDark;
  }

  static Color getLightDark(BuildContext context, {bool? reverse}) {
    return reverse == true
        ? context.isDarkMode
            ? AppColor.darkScaffold
            : AppColor.ligthScaffold
        : context.isDarkMode
        ? AppColor.ligthScaffold
        : AppColor.darkScaffold;
  }

  static Color transGrey = Colors.grey.withValues(alpha: 220);
}
