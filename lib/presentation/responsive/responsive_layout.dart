// Flutter imports:
import 'package:flutter/widgets.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    this.mobileBody,
    this.tabletBody,
    this.desktopBody,
  });

  final Widget? mobileBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileBody ?? const SizedBox.shrink();
        } else if (constraints.maxWidth < 1200) {
          return tabletBody ?? const SizedBox.shrink();
        } else {
          return desktopBody ?? const SizedBox.shrink();
        }
      },
    );
  }
}
