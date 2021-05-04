import 'package:braille_abc/models/study_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:braille_abc/models/app_names.dart';

class Saves {
  static int lessonNum = 1;
  static int lessonStepNum = 0;


  static Future saveLessonProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(StudyModel.currentLessonIndex == Saves.lessonNum - 1) {
      await prefs.setInt(LessonNums.getName(lessonNumber.lessonStep), StudyModel.curLessonPart.stepNumber);
    }
  }

  static Future loadLessonProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lessonNum = prefs.getInt(LessonNums.getName(lessonNumber.lesson)) ?? 1;
    lessonStepNum = prefs.getInt(LessonNums.getName(lessonNumber.lessonStep)) ?? 0;
  }

  static Future isLessonCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (StudyModel.curLessonPart.stepNumber == StudyModel.curLessonLength) {
      await prefs.setInt(LessonNums.getName(lessonNumber.lesson), StudyModel.curLessonPart.number + 1);
      await prefs.setInt(LessonNums.getName(lessonNumber.lessonStep), 0);
    }
  }
}
