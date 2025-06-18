// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../app/theme/app_color.dart';
import '../../../app/util/screen_helper.dart';
import '../widget/hover_scale_animation_widget.dart';

class TechComponent extends StatelessWidget {
  const TechComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktopBody: _techDesktopLayout(context),
      tabletBody: _techDesktopLayout(context),
      mobileBody: _techDesktopLayout(context),
    );
  }

  Widget _techDesktopLayout(BuildContext context) {
    double wrapConstraintHeight =
        MediaQuery.of(context).size.width *
        (ScreenHelper.isDesktop(context) ? .7 : .85);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: _techContainerDecoration(context),
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
          SizedBox(
            width: wrapConstraintHeight,
            child: Wrap(
              spacing: 20,
              runSpacing: 40,
              alignment: WrapAlignment.center,
              children: List.generate(
                16,
                (index) => HoverScaleAnimationWidget(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColor.transGrey,
                      border: Border.all(
                        width: 2,
                        color: AppColor.getLightDark(context),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FlutterLogo(
                      size: ScreenHelper.isMobile(context) ? 60 : 80,
                    ),
                  ),
                ),
              ),
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
}
