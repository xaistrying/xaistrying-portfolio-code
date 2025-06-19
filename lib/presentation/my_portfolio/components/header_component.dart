// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/theme/app_color.dart';
import 'package:xaistrying_portfolio/app/util/screen_helper.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktopBody: _headerDesktopLayout(context),
      tabletBody: _headerTabletLayout(context),
      mediumDesktopBody: _headerMediumDesktopLayout(context),
      mobileBody: _headerMediumDesktopLayout(context),
    );
  }

  Widget _headerDesktopLayout(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 800, minHeight: 600),
      height:
          MediaQuery.of(context).size.height *
          (ScreenHelper.isMobile(context) ? .7 : .85),
      padding: EdgeInsets.symmetric(vertical: 80),
      decoration: _headerContainerDecoration(context),
      child: Row(
        spacing: 80 * (MediaQuery.of(context).size.width / 1200),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_headerContent(context), FlutterLogo(size: 600)],
      ),
    );
  }

  Widget _headerTabletLayout(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 600, minHeight: 400),
      height:
          MediaQuery.of(context).size.height *
          (ScreenHelper.isMobile(context) ? .7 : .85),
      padding: EdgeInsets.symmetric(vertical: 40),
      decoration: _headerContainerDecoration(context),
      child: Row(
        spacing: 40 * (MediaQuery.of(context).size.width / 800),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_headerContent(context), FlutterLogo(size: 400)],
      ),
    );
  }

  Widget _headerMediumDesktopLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      decoration: _headerContainerDecoration(context),
      child: ListView(
        shrinkWrap: true,
        cacheExtent: 10000,
        physics: NeverScrollableScrollPhysics(),
        children: [
          FlutterLogo(size: 400),
          SizedBox(height: 40),
          _headerContent(context, isContraintContentWidth: false),
        ],
      ),
    );
  }

  Widget _headerContent(
    BuildContext context, {
    bool isContraintContentWidth = true,
  }) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Lorem Ipsum',
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: AppColor.getLightDark(context),
        ),
      ),
      SizedBox(height: 20),
      SizedBox(
        width:
            isContraintContentWidth
                ? 200 * (MediaQuery.of(context).size.width / 600)
                : double.infinity,
        child: Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.getLightDark(context),
          ),
        ),
      ),
      SizedBox(height: 40),
      Transform.translate(
        offset: Offset(-4.0, 0),
        child: FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          ),
          child: Text(
            'Button',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.getLightDark(context, reverse: true),
            ),
          ),
        ),
      ),
    ],
  );

  Decoration? _headerContainerDecoration(BuildContext context) => BoxDecoration(
    border: Border(
      bottom: BorderSide(color: AppColor.getWhiteBlack(context), width: 2),
    ),
  );
}
