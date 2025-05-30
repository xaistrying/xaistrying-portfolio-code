// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../block/certificate_block_widget.dart';
import '../block/experience_block_widget.dart';
import '../block/info_block_widget.dart';
import '../block/project_block_widget.dart';
import '../block/skill_block_widget.dart';

class DesktopScreen extends StatelessWidget {
  const DesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      child: Row(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoBlockWidget(),
                Expanded(child: ExperienceBlockWidget()),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Column(
              spacing: 20,
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: ProjectBlockWidget()),
                      Expanded(child: CertificateBlockWidget()),
                    ],
                  ),
                ),
                Expanded(flex: 4, child: SkillBlockWidget()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
