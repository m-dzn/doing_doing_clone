import 'package:flutter/cupertino.dart';

import 'emotion.dart';

class EmotionInput extends StatefulWidget {
  @override
  _EmotionInput createState() => _EmotionInput();
}

class _EmotionInput extends State<EmotionInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Emotion(),
        Emotion(),
        Emotion(),
        Emotion(),
        Emotion(),
        Emotion()
      ],
    );
  }
}