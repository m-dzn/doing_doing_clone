import 'package:flutter/material.dart';
import 'package:doing_doing_clone/widget/common/name_sticker.dart';
import 'package:intl/intl.dart';

class DiaryNavBar extends StatefulWidget {
  DateTime date;

  DiaryNavBar({
    super.key,
    required this.date
  });

  @override
  _DiaryNavBarState createState() => _DiaryNavBarState();
}

class _DiaryNavBarState extends State<DiaryNavBar> {
  DateFormat dateFormat = DateFormat('MM월 dd일 (E)', 'ko');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black38),
                onPressed: () {}),
            const SizedBox(width: 8),
            NameSticker(label: dateFormat.format(widget.date)),
            const SizedBox(width: 8),
            IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.black38),
                onPressed: () {}),
          ],
        ));
  }
}
