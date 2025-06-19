// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/util/screen_helper.dart';
import '../../../app/theme/app_color.dart';

class ExpComponent extends StatelessWidget {
  const ExpComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktopBody: _expLayout(context),
      tabletBody: _expLayout(context),
      mobileBody: _expLayout(context),
    );
  }

  Widget _expLayout(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      decoration: _techContainerDecoration(context),
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
          if (ScreenHelper.isDesktop(context))
            Row(
              spacing: 40,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_expCard(context), _expCard(context)],
            )
          else
            Column(
              spacing: 40,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [_expCard(context), _expCard(context)],
            ),
        ],
      ),
    );
  }

  Widget _expCard(BuildContext context) {
    return Container(
      width: 480,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColor.transGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _defaultHorizontalPadding(
            child: Row(
              spacing: 16,
              children: [
                CircleAvatar(
                  radius: 24,
                  child: Icon(Icons.flutter_dash, size: 28),
                ),
                Flexible(
                  child: Text(
                    'Lorem Ipsum ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColor.getLightDark(context), height: 40),
          _defaultHorizontalPadding(
            child: Text(
              '2020 - 2025',
              style: TextStyle(
                fontSize: 20,
                color: AppColor.getLightDark(context),
              ),
            ),
          ),
          _defaultHorizontalPadding(
            child: Text(
              'Lorem Ipsum',
              style: TextStyle(
                fontSize: 20,
                color: AppColor.getLightDark(context),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          _defaultHorizontalPadding(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2.0, right: 16.0),
                  child: Icon(Icons.circle_rounded, size: 8),
                ),
                Flexible(
                  child: Text(
                    'Lorem Ipsum ',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.getLightDark(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Decoration? _techContainerDecoration(BuildContext context) => BoxDecoration(
    border: Border(
      bottom: BorderSide(color: AppColor.getWhiteBlack(context), width: 2),
    ),
  );

  Padding _defaultHorizontalPadding({required Widget child}) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: child);
}
