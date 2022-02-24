import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  bool _changeHeight = false;
  late Timer _everySecond;
  bool _timerStarted = false;

  void _startTimer() {
    if (_timerStarted == false) {
      _timerStarted = true;
      _everySecond = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        if (mounted) {
          setState(() {
            _changeHeight = !_changeHeight;
          });
        }
      });
    }
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _everySecond.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
      height: _changeHeight ? 75 : 150,
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.blue),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Good luck",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 36),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.emoji_emotions_outlined,
              color: Colors.white,
              size: 42,
            ),
          ],
        ),
      ),
    );
  }
}
