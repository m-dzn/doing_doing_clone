import 'package:flutter/material.dart';

class DDTextField extends StatelessWidget {
  TextEditingController? controller;
  String hintText;
  Function(String)? onChanged;
  Function(String)? onSubmitted;

  DDTextField(
      {super.key,
      this.controller,
      this.hintText = "",
      this.onChanged,
      this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black38),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white))));
  }
}
