import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doing_doing_clone/model/model_diary.dart';
import 'package:doing_doing_clone/utils.dart';

class DiariesApi {
  // Create
  static Future<String> createDiary(Diary diary) async {
    final diaryDoc = FirebaseFirestore.instance.collection("diary").doc();

    diary.id = diaryDoc.id;
    await diaryDoc.set(diary.toJson());

    return diaryDoc.id;
  }

  static Stream<List<Diary>> readTodos(DateTime date) {
    final DateTime start = DateTime(date.year, date.month, 1, 0 , 0, 0);
    final DateTime end = DateTime(date.year, date.month, 4, 23, 59, 59);

    return FirebaseFirestore.instance
      .collection('diary')
      .where(DiaryField.date, isGreaterThanOrEqualTo: start, isLessThanOrEqualTo: end)
      .snapshots()
      .transform(Utils.transformer(Diary.fromJson));
    }

  static Future updateTodo(Diary diary) async {
    final diaryDoc = FirebaseFirestore.instance.collection("diary").doc(diary.id);
    await diaryDoc.update(diary.toJson());
  }

  static Future deleteTodo(Diary diary) async {
    final diaryDoc = FirebaseFirestore.instance.collection("diary").doc(diary.id);
    await diaryDoc.delete();
  }
}