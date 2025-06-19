// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../nav/widget/sliver_app_bar_widget.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: CustomScrollView(slivers: [SliverAppBarWidget()]),
    );
  }
}
