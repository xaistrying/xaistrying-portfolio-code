// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';

// Project imports:
import '../../../../app/constant/image_constant.dart';
import '../../../../app/theme/app_color.dart';

// Project imports:

class TimelineTile extends StatelessWidget {
  const TimelineTile({
    super.key,
    this.isTheLastOne = false,
    this.title = '',
    this.subtitile = '',
    this.iconType,
    this.startTime = '',
    this.endTime = '',
  });

  final String startTime;
  final String endTime;
  final String title;
  final String subtitile;
  final bool isTheLastOne;
  final BuildingIconType? iconType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 20,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
            ),
            Text('$startTime - $endTime', style: TextStyle(fontSize: 20)),
          ],
        ),
        IntrinsicHeight(
          child: Row(
            spacing: 20,
            children: [
              SizedBox(
                width: 20,
                child: VerticalDivider(
                  color:
                      isTheLastOne
                          ? Colors.transparent
                          : AppColor.getWhiteBlack(
                            context,
                          ).withValues(alpha: 180),
                  thickness: 2,
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 16),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.transGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (iconType != null)
                            if (iconType == BuildingIconType.school)
                              SvgPicture.asset(
                                ImageConstant.school,
                                colorFilter: ColorFilter.mode(
                                  AppColor.getWhiteBlack(context),
                                  BlendMode.srcIn,
                                ),
                              )
                            else
                              SvgPicture.asset(
                                ImageConstant.company,
                                colorFilter: ColorFilter.mode(
                                  AppColor.getWhiteBlack(context),
                                  BlendMode.srcIn,
                                ),
                              )
                          else
                            const SizedBox.shrink(),
                          Flexible(
                            child: Text(title, style: TextStyle(fontSize: 20)),
                          ),
                        ],
                      ),
                      Text(subtitile, style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum BuildingIconType { school, company }
