import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

class RalphWalk extends StatefulWidget {
  double? scale;
  RalphWalk({Key? key, this.scale = 0.4}) : super(key: key);

  @override
  State<RalphWalk> createState() => _RalphWalkState();
}

class _RalphWalkState extends State<RalphWalk> {
  List<String> frames = [
    'assets/sprite/ralph/ralph_walk_1.png',
    'assets/sprite/ralph/ralph_walk_2.png',
  ];

  int currentFrameIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(const Duration(milliseconds: 300),
        builder: (context) {
      currentFrameIndex = (currentFrameIndex + 1) % frames.length;

      return Image.asset(
        frames[currentFrameIndex],
        scale: widget.scale,
      );
    });
  }
}
