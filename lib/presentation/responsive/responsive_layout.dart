// Flutter imports:
import 'package:flutter/widgets.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    this.mobileBody,
    this.tabletBody,
    this.desktopBody,
    this.verTabletBody,
  });

  final Widget? mobileBody;
  final Widget? tabletBody;
  final Widget? verTabletBody;
  final Widget? desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileBody ?? const SizedBox.shrink();
        } else if (constraints.maxWidth < 800) {
          return verTabletBody ?? tabletBody ?? const SizedBox.shrink();
        } else if (constraints.maxWidth < 1200) {
          return tabletBody ?? const SizedBox.shrink();
        } else {
          if (constraints.maxHeight < 600) {
            return tabletBody ?? const SizedBox.shrink();
          }
          return desktopBody ?? const SizedBox.shrink();
        }
      },
    );
  }
}
