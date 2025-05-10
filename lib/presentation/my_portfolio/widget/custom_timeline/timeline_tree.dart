// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xaistrying_portfolio/presentation/my_portfolio/widget/custom_timeline/timeline_tile.dart';

class TimelineTree extends StatelessWidget {
  const TimelineTree({super.key, required this.tiles});

  final List<TimelineTile> tiles;

  @override
  Widget build(BuildContext context) {
    return Column(children: tiles.map((tile) => tile).toList());
  }
}
