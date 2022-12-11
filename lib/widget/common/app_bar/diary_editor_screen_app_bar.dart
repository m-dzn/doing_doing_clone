import 'package:doing_doing_clone/provider/date_time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiaryEditorScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DiaryEditorScreenAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    DateTimeProvider dateTimeProvider = Provider.of(context);

    return PreferredSize(
        preferredSize: preferredSize,
        child: SizedBox(
            height: 60,
            child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context, dateTimeProvider.dateTime);
                    },
                  ),
                ]
            )
        )
    );
  }
}
