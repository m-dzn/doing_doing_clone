import 'package:doing_doing_clone/provider/date_time_provider.dart';
import 'package:doing_doing_clone/screen/screen_diary_editor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiaryAppBarMenu extends StatelessWidget {
  const DiaryAppBarMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTimeProvider dateTimeProvider = Provider.of(context);

    return Row(
        children: <Widget>[
          const Icon(Icons.more_horiz, size: 30),
          const SizedBox(width: 20),
          OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  side:
                  const BorderSide(width: 1, color: Colors.black45)),
              child: TextButton(
                child: const Text("오늘", style: TextStyle(color: Colors.black45)),
                onPressed: () {
                  dateTimeProvider.changeDateTime(DateTime.now());
                },
              )
          ),
          const SizedBox(width: 20),
          IconButton(
            icon: const Icon(Icons.add, size: 30),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const DiaryEditorScreen()
              ));
            },
          )
        ]
    );
  }
}
