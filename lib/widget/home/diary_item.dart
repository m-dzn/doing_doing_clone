import 'package:doing_doing_clone/screen/screen_diary.dart';
import 'package:flutter/material.dart';
import 'package:doing_doing_clone/widget/common/name_sticker.dart';
import 'package:intl/intl.dart';

import '../../model/model_diary.dart';

class DiaryItem extends StatefulWidget {
  Diary diary;

  DiaryItem({
    super.key,
    required this.diary
  });

  @override
  _DiaryItemState createState() => _DiaryItemState();
}

class _DiaryItemState extends State<DiaryItem> {
  DateFormat dateFormat = DateFormat('MM월 dd일 (E)', 'ko');
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => DiaryScreen(diary: widget.diary)
        ));
      },
        child: Container(
            // 외부 여백
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            child: Container(
                // 테두리 박스
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.3)),
                padding: const EdgeInsets.all(24),
                child:
                    Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                  Container(
                      // Header
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black12, width: 2)),
                      child: Column(
                          children: <Widget>[NameSticker(label: dateFormat.format(widget.diary.dateTime))])),
                  Container(
                      // Body
                      margin: const EdgeInsets.only(top: 64),
                      child: Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                /*TodoItem()*/
                              ])))
                ]))));
  }
}
