// Flutter imports:
import 'package:flutter/material.dart';
import 'package:xaistrying_portfolio/presentation/my_portfolio/components/header_component.dart';

class MyPortfolioScreen extends StatelessWidget {
  const MyPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: [HeaderComponent()]));
  }
}
