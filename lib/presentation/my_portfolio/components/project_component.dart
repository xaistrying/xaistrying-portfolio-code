// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/constant/image_constant.dart';
import '../../../app/theme/app_color.dart';
import '../../../app/util/screen_helper.dart';

class ProjectComponent extends StatelessWidget {
  const ProjectComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktopBody: _projectDesktopLayout(context),
      tabletBody: _projectTabletLayout(context),
      mediumDesktopBody: _projectMediumDesktopLayout(context),
      mobileBody: _projectMobileLayout(context),
    );
  }

  Widget _projectDesktopLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      decoration: _projectContainerDecoration(context),
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
            children: List.generate(5, (index) => _projectCard(context)),
          ),
        ],
      ),
    );
  }

  Widget _projectTabletLayout(BuildContext context) {
    ValueNotifier<int> cardIndex = ValueNotifier(0);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 32),
      decoration: _projectContainerDecoration(context),
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
              height: 520,
              onPageChanged: (index, reason) => cardIndex.value = index,
              viewportFraction:
                  0.7 - (0.2 * MediaQuery.of(context).size.width / 1000),
              enlargeCenterPage: true,
              enlargeFactor: 0.15,
            ),
            items: List<Widget>.generate(5, (int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: _projectCard(context),
              );
            }),
          ),
          ValueListenableBuilder(
            valueListenable: cardIndex,
            builder:
                (context, value, child) => AnimatedSmoothIndicator(
                  activeIndex: value,
                  count: 5,
                  effect: SwapEffect(
                    activeDotColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
          ),
        ],
      ),
    );
  }

  Widget _projectMobileLayout(BuildContext context) {
    ValueNotifier<int> cardIndex = ValueNotifier(0);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 32),
      decoration: _projectContainerDecoration(context),
      child: Column(
        spacing: 40,
        children: [
          Text(
            'Lorem Ipsum',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.getLightDark(context),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 520,
              onPageChanged: (index, reason) => cardIndex.value = index,
              viewportFraction: 1,
            ),
            items: List<Widget>.generate(5, (int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: _projectCard(context),
              );
            }),
          ),
          ValueListenableBuilder(
            valueListenable: cardIndex,
            builder:
                (context, value, child) => AnimatedSmoothIndicator(
                  activeIndex: value,
                  count: 5,
                  effect: SwapEffect(
                    activeDotColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
          ),
        ],
      ),
    );
  }

  Widget _projectMediumDesktopLayout(BuildContext context) {
    ValueNotifier<int> cardIndex = ValueNotifier(0);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 32),
      decoration: _projectContainerDecoration(context),
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
              height: 520,
              onPageChanged: (index, reason) => cardIndex.value = index,
              enlargeCenterPage: true,
              enlargeFactor: 0.15,
            ),
            items: List<Widget>.generate(5, (int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: _projectCard(context),
              );
            }),
          ),
          ValueListenableBuilder(
            valueListenable: cardIndex,
            builder:
                (context, value, child) => AnimatedSmoothIndicator(
                  activeIndex: value,
                  count: 5,
                  effect: SwapEffect(
                    activeDotColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
          ),
        ],
      ),
    );
  }

  Widget _projectCard(BuildContext context) {
    return Container(
      width: 520,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColor.transGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time Range
          _defaultHorizontalPadding(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                  child: Row(
                    spacing: 4,
                    children: List.generate(2, (index) {
                      double radius = 12;
                      return Container(
                        width: radius,
                        height: radius,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: AppColor.getWhiteLightBlack(context),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                if (!ScreenHelper.isMobile(context))
                  Text(
                    '${DateFormat.yMMM().format(DateTime.now())} - ${DateFormat.yMMM().format(DateTime.now())}',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.getLightDark(context),
                    ),
                  ),
                SizedBox(width: 50),
              ],
            ),
          ),
          if (ScreenHelper.isMobile(context)) ...[
            SizedBox(height: 12),
            _defaultHorizontalPadding(
              child: Text(
                '${DateFormat.yMMM().format(DateTime.now())} - ${DateFormat.yMMM().format(DateTime.now())}',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.getLightDark(context),
                ),
              ),
            ),
          ],
          SizedBox(height: 20),
          Divider(
            color: AppColor.getLightDark(context),
            height: 0,
            thickness: 2,
          ),

          // Image
          Container(
            width: double.infinity,
            height: 200,
            color: Theme.of(context).colorScheme.primary,
          ),

          // Description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              'Lorem Ipsum',
              style: TextStyle(
                fontSize: 20,
                color: AppColor.getLightDark(context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _defaultHorizontalPadding(
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              style: TextStyle(
                fontSize: 20,
                color: AppColor.getLightDark(context),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          if (ScreenHelper.isDesktop(context))
            SizedBox(height: 20)
          else
            Spacer(),

          _defaultHorizontalPadding(
            child: Row(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _siteIcon(
                  context,
                  iconLink: ImageConstant.apple,
                  onPressed: () {},
                ),
                _siteIcon(
                  context,
                  iconLink: ImageConstant.android,
                  onPressed: () {},
                ),
                _siteIcon(
                  context,
                  iconLink: ImageConstant.earth,
                  onPressed: () {},
                ),
                _siteIcon(
                  context,
                  iconLink: ImageConstant.github,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _siteIcon(
    BuildContext context, {
    Function()? onPressed,
    required String iconLink,
  }) => IconButton(
    onPressed: onPressed,
    constraints: BoxConstraints(),
    style: IconButton.styleFrom(
      alignment: Alignment.centerLeft,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: BorderSide(width: 2, color: AppColor.getWhiteBlack(context)),
    ),
    icon: SvgPicture.asset(
      iconLink,
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.primary,
        BlendMode.srcIn,
      ),
    ),
  );

  Decoration? _projectContainerDecoration(BuildContext context) =>
      BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColor.getWhiteBlack(context), width: 2),
        ),
        color: AppColor.transGrey,
      );

  Padding _defaultHorizontalPadding({required Widget child}) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: child);
}
