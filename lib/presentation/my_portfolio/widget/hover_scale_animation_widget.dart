// Flutter imports:
import 'package:flutter/material.dart';

class HoverScaleAnimationWidget extends StatefulWidget {
  const HoverScaleAnimationWidget({super.key, required this.child});

  final Widget child;

  @override
  State<HoverScaleAnimationWidget> createState() =>
      _HoverScaleAnimationWidgetState();
}

class _HoverScaleAnimationWidgetState extends State<HoverScaleAnimationWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: MouseRegion(
        onEnter:
            (_) => setState(() {
              _isHovered = true;
            }),
        onExit:
            (_) => setState(() {
              _isHovered = false;
            }),
        child: AnimatedScale(
          scale: _isHovered ? 1.15 : 1.0,
          duration: Durations.short3,
          curve: Curves.easeOut,
          child: widget.child,
        ),
      ),
    );
  }
}
