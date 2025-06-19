// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

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
        ],
      ),
    );
  }

  Widget _projectMobileLayout(BuildContext context) {
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
            ),
          ),
          SizedBox(height: 20),
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
