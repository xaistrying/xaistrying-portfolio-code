// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/theme/app_color.dart';

class AppTheme {
  AppTheme._();

  static TextTheme? textTheme = GoogleFonts.robotoMonoTextTheme();

  static final _lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    textTheme: textTheme,
    scaffoldBackgroundColor: AppColor.ligthScaffold,
    appBarTheme: AppBarTheme(color: Colors.transparent),
  );

  static final _darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: textTheme,
    scaffoldBackgroundColor: AppColor.darkScaffold,
    appBarTheme: AppBarTheme(color: Colors.transparent),
  );

  static ThemeData get lightTheme => _lightTheme;
  static ThemeData get darkTheme => _darkTheme;
}
