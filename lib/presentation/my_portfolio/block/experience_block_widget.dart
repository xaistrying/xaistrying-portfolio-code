// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
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
        ],
      ),
    );
  }
}
