library animated_progress_bar;

import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatefulWidget {
  final double? width;
  final double height;
  final BorderRadius radius;
  final double value;
  final Color bgColor;
  final Color progressColor;
  final Duration duration;
  final Curve curve;
  final bool centered;
  final Duration delay;

  const AnimatedProgressBar({
    Key? key,
    this.width,
    this.height = 3,
    this.radius = BorderRadius.zero,
    this.bgColor = Colors.white54,
    this.progressColor = Colors.white,
    this.duration = const Duration(milliseconds: 700),
    this.centered = false,
    required this.value,
    this.curve = Curves.fastOutSlowIn,
    this.delay = Duration.zero,
  })  : assert(value >= 0 && value <= 1),
        super(key: key);

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar> {
  bool animate = false;

  @override
  void initState() {
    if (!animate) {
      Future.delayed(widget.delay, () {
        setState(() {
          animate = true;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.radius,
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          alignment: widget.centered ? Alignment.center : Alignment.centerLeft,
          children: <Widget>[
            Container(
              width: widget.width ?? constraints.maxWidth,
              height: widget.height,
              color: widget.bgColor,
            ),
            ClipRRect(
                borderRadius: widget.radius,
                child: AnimatedContainer(
                  width: animate
                      ? widget.value * (widget.width ?? constraints.maxWidth)
                      : 0,
                  height: widget.height,
                  color: widget.progressColor,
                  curve: widget.curve,
                  duration: widget.duration,
                )),
          ],
        );
      }),
    );
  }
}
