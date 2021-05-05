import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/symbol/list_symbols.dart';
import 'package:flutter/cupertino.dart';
import 'package:xml/xml.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';

import 'package:braille_abc/models/lesson_model.dart';

@immutable
class StudyModel {
  static int number = 1;
  static final List<Lesson> _lessons = [];
  static int _currentLessonPartIndex = 0;
  static int _currentLessonIndex = 0;

  static int get lessonsNum => _lessons.length;

  static int get curLessonLength => _lessons[_currentLessonIndex].lessonComponent.length;

  static Lesson getLessonByIndex(index)=> _lessons[index];

  static Lesson get curLesson => _lessons[_currentLessonIndex];

  static LessonComponents get curLessonPart => _lessons[_currentLessonIndex].lessonComponent[_currentLessonPartIndex];

  static lessonType get currentLessonType => curLessonPart.type;

  static bool incLessonPartIndex() {
    if (_currentLessonPartIndex < curLesson.lessonComponent.length - 1) {
      _currentLessonPartIndex++;
      return true;
    }
    return false;
  }

  static bool decLessonPartIndex() {
    if (_currentLessonPartIndex > 0) {
      _currentLessonPartIndex--;
      return true;
    }
    return false;
  }

  // ignore: avoid_setters_without_getters
  static set currentLessonIndex(int index) {
    _currentLessonIndex = index;
  }

  static void rebootLessons() {
    _currentLessonPartIndex = 0;
  }

  static String getType(lessonType type) {
    switch (type) {
      case lessonType.practice:
        return "practice";
      case lessonType.reading:
        return "reading";
      case lessonType.text:
        return "info";
    }
    return null;
  }

  static Future<Null> fillStudyModel(BuildContext context) async {
    String xmlString = await DefaultAssetBundle.of(context).loadString("data/studying.xml");
    var xml = XmlDocument.parse(xmlString);
    _parseXmlSection("lesson", xml);
    return null;
  }

  static Null _parseXmlSection(String sectionName, XmlDocument xml) {
    var sections = xml.findAllElements(sectionName);
    for (var el in sections) {
      List<LessonComponents> lessonsComponents = [];
      var lessonNumber = 0;
      var components = el.children;
      for (var comp in components) {
        if (comp.children.isNotEmpty) {
          lessonNumber++;
          var type = comp.getAttribute("type");
          if (type != null) {
            if (type == getType(lessonType.practice)) {
              lessonsComponents.add(
                  PracticeLesson(lessonType.practice, comp.getAttribute("title"), comp.text, number, lessonNumber));
            } else if (type == getType(lessonType.reading)) {
              lessonsComponents
                  .add(ReadingLesson(lessonType.reading, comp.getAttribute("title"), comp.text, number, lessonNumber));
            } else if (type == getType(lessonType.text)) {
              lessonsComponents.add(TextLesson(lessonType.text, comp.text, number, lessonNumber));
            }
          }
        }
      }
      var lesson = Lesson(number, el.getAttribute("name"), lessonsComponents);
      number++;
      _lessons.add(lesson);
    }
    return null;
  }

  static List<int> createSymbol(String symbol) {
    List<int> dots = [];
    var result = symbol.replaceAll(RegExp(r'[(),) ]'), '').replaceAll("\n", "").replaceAll("\r", "");
    for (int i = 0; i < result.length; i++) {
      if (result[i] == "T") {
        dots.add(i + 1);
      }
    }
    return dots;
  }

  static List<String> parseTitle(String text) {
    if (text.isEmpty) {
      return null;
    }
    var result = text.split(":");
    return result;
  }

  static Symbol parseSymbol(String text) {
    var result;
    if (text.contains(":")) {
      result = text.split(":");
      var name = result[1].replaceAll(" ", "").replaceAll("\n", "").replaceAll("\r", "");
      var studySymbol = Search.element(name, SectionNames.getType(text));
      return studySymbol;
    }
    return null;
  }
}
