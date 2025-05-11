// Flutter imports:
import 'package:flutter/material.dart';
import 'package:xaistrying_portfolio/presentation/my_portfolio/responsive/mobile_screen.dart';

// Project imports:
import 'package:xaistrying_portfolio/presentation/responsive/responsive_layout.dart';
import 'package:xaistrying_portfolio/presentation/my_portfolio/responsive/tablet_screen.dart';
import 'responsive/desktop_screen.dart';

class MyPortfolioScreen extends StatelessWidget {
  const MyPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        desktopBody: DesktopScreen(),
        tabletBody: TabletScreen(),
        mobileBody: MobileScreen(),
      ),
    );
  }
}
