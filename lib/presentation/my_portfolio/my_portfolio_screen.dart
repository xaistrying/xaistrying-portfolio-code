// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xaistrying_portfolio/presentation/my_portfolio/components/exp_component.dart';
import 'package:xaistrying_portfolio/presentation/my_portfolio/components/header_component.dart';
import 'package:xaistrying_portfolio/presentation/my_portfolio/components/tech_component.dart';

class MyPortfolioScreen extends StatelessWidget {
  const MyPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [HeaderComponent(), TechComponent(), ExpComponent()],
      ),
    );
  }
}
