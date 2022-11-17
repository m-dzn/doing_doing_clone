import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WriteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 28,
            height: 28,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                shape: BoxShape.circle),
            child: IconButton(
              icon: const Icon(Icons.edit, size: 18),
              padding: EdgeInsets.zero,
              onPressed: () {},
            )));
  }
}
