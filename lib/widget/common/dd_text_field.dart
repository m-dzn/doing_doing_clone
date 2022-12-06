import 'package:flutter/material.dart';

class DDTextField extends StatelessWidget {
  TextEditingController?  controller;
  String                  hintText;
  bool                    readOnly;
  Function(String)?       onChanged;
  Function(String)?       onSubmitted;
  Function()?             onTap;

  DDTextField({
    super.key,
    this.controller,
    this.hintText = "",
    bool? readOnly,
    this.onChanged,
    this.onSubmitted,
    this.onTap
  }) : readOnly = readOnly ?? false;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller:     controller,
        readOnly:       readOnly,
        onChanged:      onChanged,
        onSubmitted:    onSubmitted,
        onTap:          onTap,
        decoration:     InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black38),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white))));
  }
}
