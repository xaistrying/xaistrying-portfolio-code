// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:xaistrying_portfolio/app/extension/context_extension.dart';
import '../widget/content_block_widget.dart';

class CertificateBlockWidget extends StatelessWidget {
  const CertificateBlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentBlockWidget(
      onTap: () {},
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.loc.certificates,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
