// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../widget/content_block_widget.dart';

class CertificateBlockWidget extends StatelessWidget {
  const CertificateBlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentBlockWidget(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Certificates',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
