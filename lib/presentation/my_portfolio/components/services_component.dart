// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/util/screen_helper.dart';
import '../../../app/theme/app_color.dart';

class ServicesComponent extends StatelessWidget {
  const ServicesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktopBody: _servicesDesktopLayout(context),
      tabletBody: _servicesDesktopLayout(context),
      mediumDesktopBody: _servicesMobileLayout(context),
      mobileBody: _servicesMobileLayout(context),
    );
  }

  Widget _servicesDesktopLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      decoration: _servicesContainerDecoration(context),
      child: Column(
        spacing: 40,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Lorem Ipsum',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColor.getLightDark(context),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 40,
            runSpacing: 40,
            children: List.generate(3, (index) => _serviceCard(context)),
          ),
        ],
      ),
    );
  }

  Widget _servicesMobileLayout(BuildContext context) {
    ValueNotifier<int> cardIndex = ValueNotifier(0);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 32),
      decoration: _servicesContainerDecoration(context),
      child: Column(
        spacing: 40,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Lorem Ipsum',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColor.getLightDark(context),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 300,
              onPageChanged: (index, reason) => cardIndex.value = index,
              viewportFraction: 1,
            ),
            items: List<Widget>.generate(3, (int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: _serviceCard(context),
              );
            }),
          ),
          ValueListenableBuilder(
            valueListenable: cardIndex,
            builder:
                (context, value, child) => AnimatedSmoothIndicator(
                  activeIndex: value,
                  count: 3,
                  effect: SwapEffect(
                    activeDotColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
          ),
        ],
      ),
    );
  }

  Widget _serviceCard(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 400,
          margin: const EdgeInsets.only(top: 50),
          padding: const EdgeInsets.only(
            top: 62,
            bottom: 20,
            right: 20,
            left: 20,
          ),
          decoration: BoxDecoration(
            color: AppColor.transGrey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            spacing: 20,
            children: [
              Text(
                'Lorem Ipsum',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.getLightDark(context),
                ),
              ),
              if (ScreenHelper.isMobile(context))
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColor.getLightDark(context),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              else
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.getLightDark(context),
                  ),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
        Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.secondaryContainer,
            border: Border.all(
              width: 8,
              color: AppColor.getLightDark(context, reverse: true),
            ),
          ),
          child: FlutterLogo(),
        ),
      ],
    );
  }

  Decoration? _servicesContainerDecoration(BuildContext context) =>
      BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColor.getWhiteBlack(context), width: 2),
        ),
      );
}
