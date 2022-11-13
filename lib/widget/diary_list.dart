import 'package:doing_doing_clone/model/model_diary.dart';
import 'package:doing_doing_clone/widget/diary_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiaryList extends StatefulWidget {
  Diary? diary;

  DiaryList({super.key, this.diary});

  @override
  _DiaryListState createState() => _DiaryListState();
}

class _DiaryListState extends State<DiaryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(24),
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: (5 / 8),
            children: List.generate(4, (index) {
              //item 의 반복문 항목 형성
              return DiaryItem(
                  diary: Diary(date: DateTime.now(), emotion: 'ANGRY'));
            })));
  }
}
