import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doing_doing_clone/model/model_diary.dart';
import 'package:doing_doing_clone/utils.dart';
import 'package:intl/intl.dart';

class DiariesApi {
  static DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  // Create
  static Future<String> createDiary(Diary diary) async {
    String dateString = dateFormat.format(diary.dateTime);

    final diaryDoc = FirebaseFirestore.instance.collection("diary").doc(dateString);

    diary.id = diaryDoc.id;
    await diaryDoc.set(diary.toJson());

    return diaryDoc.id;
  }

  static Stream<List<Diary>> readDiaries(DateTime date) {
    final DateTime start = DateTime(date.year, date.month, 1);
    final DateTime end = DateTime(date.year, date.month + 1, 0);

    print('$start, $end');

    return FirebaseFirestore.instance
      .collection('diary')
      .where(DiaryField.dateTime, isGreaterThanOrEqualTo: start, isLessThanOrEqualTo: end)
      .snapshots()
      .transform(Utils.transformer(Diary.fromJson));
  }

  static Future<Diary?> readDiary(DateTime date) async {
    final String dateString = dateFormat.format(date);
    final snapshot = await FirebaseFirestore.instance.collection("diary").doc(dateString).get();

    if (snapshot.exists) {
      return Diary.fromJson(snapshot.data()!, snapshot.reference.id);
    }

    return null;
  }

  static Future<Diary> getPrevDiary(DateTime dateTime) async {
    final snapshot = (await FirebaseFirestore.instance.collection("diary").orderBy(DiaryField.dateTime, descending: true).startAfter([Utils.fromDateTimeToJson(dateTime)]).limit(1).get()).docs.first;
    return Diary.fromJson(snapshot.data(), snapshot.reference.id);
  }

  static Future<Diary> getNextDiary(DateTime dateTime) async {
    final snapshot = (await FirebaseFirestore.instance.collection("diary").orderBy(DiaryField.dateTime).startAfter([Utils.fromDateTimeToJson(dateTime)]).limit(1).get()).docs.first;
    return Diary.fromJson(snapshot.data(), snapshot.reference.id);
  }

  static Future updateDiary(Diary diary) async {
    print(diary.id);
    final diaryDoc = FirebaseFirestore.instance.collection("diary").doc(diary.id);
    await diaryDoc.update(diary.toJson());
  }

  static Future deleteDiary(Diary diary) async {
    final diaryDoc = FirebaseFirestore.instance.collection("diary").doc(diary.id);
    await diaryDoc.delete();
  }
}