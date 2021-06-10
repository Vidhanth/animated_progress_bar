library animated_progress_bar;

import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius radius;
  final double value;
  final Color bgColor;
  final Color progressColor;
  final Duration duration;
  final Curve curve;
  final bool centered;

  const AnimatedProgressBar({
    Key? key,
    this.width = 200,
    this.height = 2,
    this.radius = BorderRadius.zero,
    this.bgColor = Colors.white54,
    this.progressColor = Colors.white,
    this.duration = const Duration(milliseconds: 700),
    this.centered = false,
    required this.value,
    this.curve = Curves.fastOutSlowIn,
  }) : assert(value >= 0 && value <= 1), super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius,
      child: Stack(
        alignment: centered ? Alignment.center : Alignment.centerLeft,
        children: <Widget>[
          Container(
            width: width,
            height: height,
            color: bgColor,
          ),
          AnimatedContainer(
            width: value * width,
            height: height,
            color: progressColor,
            curve: curve,
            duration: duration,
          ),
        ],
      ),
    );
  }
}
