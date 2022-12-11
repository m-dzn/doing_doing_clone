import 'package:doing_doing_clone/api/api_diaries.dart';
import 'package:doing_doing_clone/model/model_diary.dart';
import 'package:doing_doing_clone/provider/date_time_provider.dart';
import 'package:doing_doing_clone/provider/diaries.dart';
import 'package:doing_doing_clone/widget/common/name_sticker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DiaryNavBar extends StatefulWidget {
  DateTime dateTime;

  DiaryNavBar({
    super.key,
    required this.dateTime
  });

  @override
  _DiaryNavBarState createState() => _DiaryNavBarState();
}

class _DiaryNavBarState extends State<DiaryNavBar> {
  late DateTimeProvider _dateTimeProvider;
  DateFormat dateFormat = DateFormat('MM월 dd일 (E)', 'ko');

  @override
  Widget build(BuildContext context) {
    _dateTimeProvider = Provider.of(context);

    return SizedBox(
        height: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<Diary?>(
                future: DiariesApi.getPrevDiary(widget.dateTime),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return IconButton(
                        icon: const Icon(
                            Icons.arrow_back_ios, color: Colors.black38),
                        onPressed: () async {
                          Diary? diary = snapshot.data;
                          _dateTimeProvider.changeDateTime(diary!.dateTime);
                        }
                    );
                  } else {
                    return Container();
                  }
                }
            ),

            const SizedBox(width: 8),
            NameSticker(label: dateFormat.format(_dateTimeProvider.dateTime)),
            const SizedBox(width: 8),

            FutureBuilder<Diary?>(
                future: DiariesApi.getNextDiary(widget.dateTime),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return IconButton(
                        icon: const Icon(
                            Icons.arrow_forward_ios, color: Colors.black38),
                        onPressed: () async {
                          Diary? diary = snapshot.data;
                          _dateTimeProvider.changeDateTime(diary!.dateTime);
                        }
                    );
                  } else {
                    return Container();
                  }
                }
            )
          ],
        ));
  }
}
