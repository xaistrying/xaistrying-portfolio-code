// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../block/certificate_block_widget.dart';
import '../block/experience_block_widget.dart';
import '../block/info_block_widget.dart';
import '../block/project_block_widget.dart';
import '../block/skill_block_widget.dart';

class TabletScreen extends StatelessWidget {
  const TabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      children: [
        InfoBlockWidget(),
        SizedBox(height: 20),

        SizedBox(height: 400, child: ExperienceBlockWidget()),
        SizedBox(height: 20),

        SizedBox(height: 400, child: ProjectBlockWidget()),
        SizedBox(height: 20),

        SizedBox(height: 400, child: CertificateBlockWidget()),
        SizedBox(height: 20),

        SizedBox(height: 400, child: SkillBlockWidget()),
      ],
    );
  }
}
