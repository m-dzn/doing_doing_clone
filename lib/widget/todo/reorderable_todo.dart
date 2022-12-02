import 'package:flutter/material.dart';

class ReorderableTodo extends StatelessWidget {
  String content;

  ReorderableTodo({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(icon: const Icon(Icons.cancel_outlined, color: Colors.black,), onPressed: () {}),
          Expanded(child: Text(content)),
        ]
      )
    );
  }
}
