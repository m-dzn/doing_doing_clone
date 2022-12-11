import 'package:doing_doing_clone/api/api_diaries.dart';
import 'package:doing_doing_clone/model/model_diary.dart';
import 'package:flutter/cupertino.dart';

class DiariesProvider extends ChangeNotifier {
  Diary? _diary;

  Diary? get diary => _diary;

  /* 기본 데이터 세팅 */
  void setDiary(Diary diary) =>
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _diary = diary;
        notifyListeners();
      });

  /* 기본 CRUD 로직 */
  void createDiary(Diary diary) {
    DiariesApi.createDiary(diary);
  }

  void updateDiary(Diary diary) {
    DiariesApi.updateDiary(diary);
  }

  void removeDiary(Diary diary) => DiariesApi.deleteDiary(diary);

  /* 기타 Business Logic */
  bool toggleDisplayState(Diary diary) {
    diary.isDiaryDisplayed = !diary.isDiaryDisplayed;
    DiariesApi.updateDiary(diary);
    return diary.isDiaryDisplayed;
  }

  Future<Diary?> getNextDiary(DateTime dateTime) async {
    return DiariesApi.getNextDiary(dateTime);
  }
}