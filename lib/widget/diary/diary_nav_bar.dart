import 'package:flutter/material.dart';
import 'package:doing_doing_clone/widget/common/name_sticker.dart';

class DiaryNavBar extends StatefulWidget {
  @override
  _DiaryNavBarState createState() => _DiaryNavBarState();
}

class _DiaryNavBarState extends State<DiaryNavBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black38),
                onPressed: () {}),
            SizedBox(width: 8),
            NameSticker(label: "11월 11일 (금)"),
            SizedBox(width: 8),
            IconButton(
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black38),
                onPressed: () {}),
          ],
        ));
  }
}
