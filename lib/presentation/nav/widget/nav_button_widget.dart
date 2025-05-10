import 'package:flutter/material.dart';
import 'package:xaistrying_portfolio/app/theme/app_color.dart';

class NavButtonWidget extends StatelessWidget {
  const NavButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

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
        style: TextStyle(fontSize: 20, color: AppColor.getWhiteBlack(context)),
      ),
    );
  }
}
