// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../nav/widget/sliver_app_bar_widget.dart';
import 'components/my_portfolio_component.dart';

class MyPortfolioScreen extends StatelessWidget {
  const MyPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBarWidget(),
          SliverList(
            delegate: SliverChildListDelegate([
              HeaderComponent(),
              TechComponent(),
              ExpComponent(),
              ProjectComponent(),
              CertComponent(),
            ]),
          ),
        ],
      ),
    );
  }
}
