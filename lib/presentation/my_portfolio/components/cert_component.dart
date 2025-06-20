// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/util/screen_helper.dart';
import 'package:xaistrying_portfolio/presentation/my_portfolio/widget/hover_scale_animation_widget.dart';
import '../../../app/theme/app_color.dart';

class CertComponent extends StatelessWidget {
  const CertComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktopBody: _certDesktopLayout(context),
      tabletBody: _certTabletLayout(context),
      mediumDesktopBody: _certMediumDesktopLayout(context),
      mobileBody: _certMobileLayout(context),
    );
  }

  Widget _certDesktopLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      decoration: _certContainerDecoration(context),
      child: Column(
        spacing: 40,
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
            children: List.generate(
              3,
              (index) => HoverScaleAnimationWidget(child: _certCard(context)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _certTabletLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      decoration: _certContainerDecoration(context),
      child: Column(
        spacing: 40,
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
            children: List.generate(
              3,
              (index) => HoverScaleAnimationWidget(child: _certCard(context)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _certMediumDesktopLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      decoration: _certContainerDecoration(context),
      child: Column(
        spacing: 40,
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
              height: 320,
              // onPageChanged: (index, reason) => cardIndex.value = index,
              viewportFraction:
                  MediaQuery.of(context).size.width < 650 ? 0.7 : 0.58,
            ),
            items: List<Widget>.generate(3, (int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: _certCard(context),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _certMobileLayout(BuildContext context) {
    ValueNotifier<int> cardIndex = ValueNotifier(0);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 32),
      decoration: _certContainerDecoration(context),
      child: Column(
        spacing: 40,
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
              height: MediaQuery.of(context).size.width / 4 * 3,
              onPageChanged: (index, reason) => cardIndex.value = index,
              viewportFraction: 1,
            ),
            items: List<Widget>.generate(3, (int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: _certSmallCard(context),
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

  Widget _certCard(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Container(
          width: 320,
          height: 240,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(
          width: 340,
          child:
              ScreenHelper.isDesktop(context)
                  ? Text(
                    'Lorem Ipsum',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.getLightDark(context),
                    ),
                    textAlign: TextAlign.center,
                  )
                  : Text(
                    'Lorem Ipsum',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.getLightDark(context),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
        ),
      ],
    );
  }

  Widget _certSmallCard(BuildContext context) {
    final size = Size(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.width / 4 * 3,
    );
    ValueNotifier<bool> isHovered = ValueNotifier(false);

    return GestureDetector(
      onTap: () {
        isHovered.value = true;
        Future.delayed(
          Duration(seconds: 1, milliseconds: 500),
          () => isHovered.value = false,
        );
      },
      child: MouseRegion(
        onEnter: (_) => isHovered.value = true,
        onExit: (_) => isHovered.value = false,
        child: Stack(
          children: [
            Container(
              constraints: BoxConstraints.tight(size),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            ValueListenableBuilder(
              valueListenable: isHovered,
              builder:
                  (context, value, child) => Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: AnimatedOpacity(
                      opacity: value ? .5 : 0.0,
                      duration: Durations.medium2,
                      child: Container(
                        height: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                          color: AppColor.lightDark,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(8),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Center(
                          child: const Text(
                            "Lorem Ipsum",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Decoration? _certContainerDecoration(BuildContext context) => BoxDecoration(
    border: Border(
      bottom: BorderSide(color: AppColor.getWhiteBlack(context), width: 2),
    ),
  );
}
