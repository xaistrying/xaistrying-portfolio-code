// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/constant/image_constant.dart';
import '../../app/theme/app_color.dart';
import '../nav/widget/sliver_app_bar_widget.dart';
import 'components/my_portfolio_component.dart';

class MyPortfolioScreen extends StatefulWidget {
  const MyPortfolioScreen({super.key});

  @override
  State<MyPortfolioScreen> createState() => _MyPortfolioScreenState();
}

class _MyPortfolioScreenState extends State<MyPortfolioScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: Durations.medium4,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBarWidget(),
          SliverList(
            delegate: SliverChildListDelegate([
              HeaderComponent(),
              ServicesComponent(),
              TechComponent(),
              ExpComponent(),
              ProjectComponent(),
              CertComponent(),
              _footerComponent(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _footerComponent() {
    return Container(
      decoration: BoxDecoration(color: AppColor.transGrey),
      child: Expanded(
        child: IconButton(
          onPressed: _scrollToTop,
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          icon: SvgPicture.asset(
            ImageConstant.arrowsUp,
            colorFilter: ColorFilter.mode(
              AppColor.getWhiteBlack(context),
              BlendMode.srcIn,
            ),
            height: 40,
          ),
        ),
      ),
    );
  }
}
