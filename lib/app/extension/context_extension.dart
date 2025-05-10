// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/l10n/generated/app_localizations.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
