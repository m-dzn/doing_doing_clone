import 'package:doing_doing_clone/screen/screen_diary_editor.dart';
import 'package:flutter/material.dart';

class WriteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.lightGreenAccent,
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext contenxt) {
            return DiaryEditorScreen();
          })),
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
