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

  static Color getWhiteBlack(BuildContext context, {bool? reverse}) {
    return reverse == true
        ? context.isDarkMode
            ? AppColor.black
            : AppColor.white
        : context.isDarkMode
        ? AppColor.white
        : AppColor.black;
  }

  static Color lightGrey = Colors.grey.withValues(alpha: 220);
}
