import 'package:flutter/material.dart';

class NameSticker extends StatelessWidget {
  NameSticker({super.key, required this.label});

  String label;

  @override
  Widget build(BuildContext context) {
    return Container( // 외부 박스 : 흰색 여백
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(5),
        child: Container( // 내부 박스 : 빨간 테두리
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red, width: 2)),
            padding:
                const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
            child: Text(label, style: TextStyle(fontSize: 18))));
  }
}
