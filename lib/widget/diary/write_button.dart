import 'package:doing_doing_clone/provider/date_time_provider.dart';
import 'package:doing_doing_clone/screen/screen_diary_editor.dart';
import 'package:doing_doing_clone/model/model_diary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WriteButton extends StatelessWidget {
  final Diary? diary;

  const WriteButton({
    Key? key,
    this.diary
  }): super (key: key);

  @override
  Widget build(BuildContext context) {
    DateTimeProvider dateTimeProvider = Provider.of(context);

    return Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.lightGreenAccent,
          onTap: () async {
            final changedDate = await Navigator.push(
                context, MaterialPageRoute(builder: (BuildContext contenxt) {
              dateTimeProvider.changeDateTime(diary?.dateTime ?? DateTime.now());
              return DiaryEditorScreen(diary: diary);
            }));

            if (changedDate != null) {
              print(changedDate);
              dateTimeProvider.changeDateTime(changedDate);
            }
          },
          child: Container(
              width: 32,
              height: 32,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  shape: BoxShape.circle),
              child:  const Icon(Icons.edit, size: 18))
        ));
  }
}
