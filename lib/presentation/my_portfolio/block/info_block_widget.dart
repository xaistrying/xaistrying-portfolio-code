// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../widget/content_block_widget.dart';

class InfoBlockWidget extends StatelessWidget {
  const InfoBlockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentBlockWidget(
      onTap: () {},
      child: Row(
        spacing: 20,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: SizedBox(width: 150, height: 200),
          ),
          Flexible(
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,\nI\'m Lorem Ipsum.',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Text(
                  'I\'m a Data Engineer. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
