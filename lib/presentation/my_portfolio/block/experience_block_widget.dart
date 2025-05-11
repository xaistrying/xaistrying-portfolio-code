// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/extension/context_extension.dart';
import 'package:xaistrying_portfolio/app/extension/string_extension.dart';
import 'package:xaistrying_portfolio/presentation/my_portfolio/widget/custom_timeline/timeline_widget.dart';
import '../widget/content_block_widget.dart';

class ExperienceBlockWidget extends StatelessWidget {
  const ExperienceBlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentBlockWidget(
      onTap: () {},
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.loc.experiences,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView(
              children: [
                TimelineTree(
                  tiles: [
                    TimelineTile(
                      startTime:
                          DateFormat.yMMMM()
                              .format(DateTime(2024, 7))
                              .toCapitalized,
                      endTime:
                          DateFormat.yMMMM()
                              .format(DateTime(2025, 4))
                              .toCapitalized,
                      title: 'SmartVietnam',
                      subtitile: 'Mobile Developer',
                      iconType: BuildingIconType.company,
                    ),
                    TimelineTile(
                      startTime:
                          DateFormat.yMMMM()
                              .format(DateTime(2021, 8))
                              .toCapitalized,
                      endTime:
                          DateFormat.yMMMM()
                              .format(DateTime(2025, 8))
                              .toCapitalized,
                      title: 'University of Science, VNUHCM',
                      subtitile: 'Bachelor in Mathematics and Computer Science',
                      isTheLastOne: true,
                      iconType: BuildingIconType.school,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
