import 'package:doing_doing_clone/widget/common/todo_item.dart';
import 'package:doing_doing_clone/widget/diary/emotion_input.dart';
import 'package:doing_doing_clone/widget/diary/write_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiaryViewer extends StatefulWidget {
  @override
  _DiaryViewerState createState() => _DiaryViewerState();
}

class _DiaryViewerState extends State<DiaryViewer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Stack(children: [
          Positioned(top: 16, right: 16, child: WriteButton()),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 28),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2)),
              child: Column(children: [
                const Text(
                  "-- Doing Doing --",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 40),
                Column(
                  // 투두 목록
                  children: [TodoItem(), TodoItem()],
                ),
                const SizedBox(height: 40),
                EmotionInput(),
                const SizedBox(height: 40),
                const TextField(
                  maxLines: null,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "오늘은 어떤 하루였나요?", border: InputBorder.none),
                )
              ]))
        ]));
  }
}
