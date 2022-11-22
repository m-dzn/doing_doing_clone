import 'package:flutter/material.dart';

enum EMOTION {
  HAPPY, FUN, SOSO, EMBARRASSED, SAD, ANGRY
}

class Emotion extends StatefulWidget {
  Emotion({super.key});

  @override
  _EmotionState createState() => _EmotionState();
}

class _EmotionState extends State<Emotion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          shape: BoxShape.circle
      ),
    );
  }
}
