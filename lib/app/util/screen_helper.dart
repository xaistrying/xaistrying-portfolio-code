// Flutter imports:
import 'package:flutter/widgets.dart';

class ScreenHelper extends StatelessWidget {
  const ScreenHelper({
    super.key,
    this.mobileBody,
    this.mediumDesktopBody,
    this.tabletBody,
    this.desktopBody,
  });

  final Widget? mobileBody;
  final Widget? mediumDesktopBody;
  final Widget? tabletBody;
  final Widget? desktopBody;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600.0;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600.0 &&
      MediaQuery.of(context).size.width < 1200.0;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return KeyedSubtree(
            key: const ValueKey('mobile'),
            child: mobileBody ?? const SizedBox.shrink(),
          );
        } else if (constraints.maxWidth < 1200) {
          if (constraints.maxWidth < 800 && mediumDesktopBody != null) {
            return KeyedSubtree(
              key: const ValueKey('mediumDesktop'),
              child: mediumDesktopBody!,
            );
          }
          return KeyedSubtree(
            key: const ValueKey('tablet'),
            child: tabletBody ?? const SizedBox.shrink(),
          );
        } else {
          return KeyedSubtree(
            key: const ValueKey('desktop'),
            child: desktopBody ?? const SizedBox.shrink(),
          );
        }
      },
    );
  }
}

/*
KeyedSubtree !?
Flutter compares widget trees using keys. When keys are different, it throws 
away the old widget and builds a new one from scratch — no transition 
animation, no layout interpolation.
 */
