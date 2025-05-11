// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../app/theme/app_color.dart';

class TitleCardWidget extends StatelessWidget {
  const TitleCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.getWhiteBlack(context), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(color: AppColor.transGrey),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'data',
                  style: TextStyle(
                    color: AppColor.getWhiteBlack(context),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),

          Divider(
            color: AppColor.getWhiteBlack(context),
            height: 0,
            thickness: 2,
          ),

          //
          Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}
