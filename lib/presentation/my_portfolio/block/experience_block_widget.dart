// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:intl/intl.dart';

// Project imports:
import 'package:xaistrying_portfolio/presentation/my_portfolio/widget/custom_timeline/timeline_widget.dart';
import '../widget/content_block_widget.dart';

class ExperienceBlockWidget extends StatelessWidget {
  const ExperienceBlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentBlockWidget(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experiences',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 20),
                TimelineTree(
                  tiles: [
                    TimelineTile(
                      startTime: DateFormat.yMMM().format(DateTime(2024, 7)),
                      endTime: DateFormat.yMMM().format(DateTime(2025, 4)),
                      title: 'SmartVietnam',
                      subtitile: 'Mobile Developer',
                      iconType: BuildingIconType.company,
                    ),
                    TimelineTile(
                      startTime: DateFormat.yMMM().format(DateTime(2021, 8)),
                      endTime: DateFormat.yMMM().format(DateTime(2025, 8)),
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
