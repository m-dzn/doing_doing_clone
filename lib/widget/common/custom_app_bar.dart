import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: Container(
            height: 60,
            child: Row(children: <Widget>[
              TextButton.icon(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                label: const Text('전체',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Spacer(),
              Row(children: <Widget>[
                const Icon(Icons.more_horiz, size: 30),
                const SizedBox(width: 20),
                OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side:
                            const BorderSide(width: 1, color: Colors.black45)),
                    child: const Text("오늘",
                        style: TextStyle(color: Colors.black45))),
                const SizedBox(width: 20),
                const Icon(Icons.add, size: 30)
              ])
            ])));
  }
}
