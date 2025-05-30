// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/extension/context_extension.dart';
import '../widget/content_block_widget.dart';

class ProjectBlockWidget extends StatelessWidget {
  const ProjectBlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentBlockWidget(
      onTap: () {},
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.loc.projects,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
