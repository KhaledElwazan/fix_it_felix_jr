import 'package:fix_it_felix_jr/ralph_animation/ralph_idle.dart';
import 'package:flutter/material.dart';

import 'ralph_animation/ralph_walk.dart';

enum RalphState {
  idle,
  walk,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RalphState ralphState = RalphState.idle;

  Map<RalphState, Widget> ralphAnimation = {
    RalphState.idle: RalphIdle(),
    RalphState.walk: RalphWalk(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: ralphAnimation[ralphState],
            ),
          ),
          Container(
            color: Colors.red,
            height: 100,
            child: Row(
              children: [
                GestureDetector(
                  onTapUp: (details) {
                    setState(() {
                      ralphState = RalphState.idle;
                    });
                  },
                  onTapDown: (details) {
                    setState(() {
                      ralphState = RalphState.walk;
                    });
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 75,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onLongPressDown: (details) {
                    // TODO: implement onLongPressDown for wreck it
                  },
                  child: const Text(
                    'W',
                    style: TextStyle(fontSize: 75, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
