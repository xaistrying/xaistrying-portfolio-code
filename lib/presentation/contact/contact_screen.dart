// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../nav/widget/sliver_app_bar_widget.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: CustomScrollView(slivers: [SliverAppBarWidget()]),
    );
  }
}
