import 'package:doing_doing_clone/widget/common/app_bar/diary_app_bar_menu.dart';
import 'package:flutter/material.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: Container(
            height: 60,
            child: Row(
                children: <Widget>[
                  TextButton.icon(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                    label: const Text('전체',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  const DiaryAppBarMenu()
                ]
            )
        )
    );
  }
}
