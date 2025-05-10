// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/theme/app_color.dart';

class NavButtonWidget extends StatelessWidget {
  const NavButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    required this.isCurrentScreen,
  });

  final VoidCallback onPressed;
  final String text;
  final bool isCurrentScreen;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        overlayColor: Colors.transparent,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color:
              isCurrentScreen
                  ? AppColor.getWhiteBlack(context)
                  : AppColor.getWhiteBlack(context).withValues(alpha: 120),
        ),
      ),
    );
  }
}
