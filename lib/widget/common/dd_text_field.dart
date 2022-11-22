import 'package:flutter/material.dart';

class DDTextField extends StatelessWidget {
  String hintText;

  DDTextField({super.key, this.hintText = ""});

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black38),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)
            )
        )
    );
  }
}
