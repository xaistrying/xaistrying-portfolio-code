// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/extension/context_extension.dart';

String getLanguage(String? languageCode) {
  switch (languageCode) {
    case 'en':
      return 'English';
    case 'vi':
      return 'Tiếng Việt';
    default:
      return '';
  }
}

String getScreenTitle(BuildContext context, {required int index}) {
  switch (index) {
    case 1:
      return context.loc.blog;
    case 2:
      return context.loc.contact;
    case 0:
    default:
      return context.loc.myPortfolio;
  }
}
