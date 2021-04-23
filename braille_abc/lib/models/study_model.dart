import 'package:flutter/cupertino.dart';
import 'package:xml/xml.dart';

enum lessonType {
  text,
  reading,
  practice,
}

@immutable
class Lesson {
  final int number;
  final String name;
  final List<LessonComponents> lessonComponents;

  Lesson(this.number, this.name, this.lessonComponents);
}

@immutable
class LessonComponents {
  final int number;
  final lessonType type;
  final String text;

  LessonComponents(this.type, this.text, this.number);
}

@immutable
class PracticeLesson extends LessonComponents {
  final String symbol;

  PracticeLesson(lessonType type, String text, this.symbol, int num) : super(type, text, num);
}

@immutable
class ReadingLesson extends LessonComponents {
  final String symbol;

  ReadingLesson(lessonType type, String text, this.symbol, int num) : super(type, text, num);
}

@immutable
class TextLesson extends LessonComponents {
  TextLesson(lessonType type, String text, int num) : super(type, text, num);
}

@immutable
class StudyModel {
  static int number = 1;
  static final List<Lesson> lessons = [];

  static Future<Null> fillStudyModel(BuildContext context) async {
    String xmlString = await DefaultAssetBundle.of(context).loadString("data/studying.xml");
    var xml = XmlDocument.parse(xmlString);
    _parseXmlSection("lesson", xml);
    return null;
  }

  static Null _parseXmlSection(String sectionName, XmlDocument xml) {
    List<LessonComponents> lessonsComponents = [];
    var sections = xml.findAllElements(sectionName);
    for (var el in sections) {
      var i = 0;
      print("lesson name = " + el.getAttribute("name"));
      var components = el.children;
      for (var comp in components) {
        i++;
        if (comp.children.isNotEmpty) {
          var type = comp.getAttribute("type");
          if (type != null) {
            print("TYPE = " + type);
            if (type == "practice") {
              print("TITLE = " + comp.getAttribute("title") + "\nTEXT = " + comp.text);
              lessonsComponents.add(PracticeLesson(lessonType.practice, comp.getAttribute("title"), comp.text, i));
            } else if (type == "reading") {
              print("TITLE = " + comp.getAttribute("title") + "\nTEXT = " + comp.text);
              lessonsComponents.add(ReadingLesson(lessonType.reading, comp.getAttribute("title"), comp.text, i));
            } else if (type == "info"){
              print("TYPE = text");
              print("TEXT = " + comp.text);
              lessonsComponents.add(TextLesson(lessonType.text, comp.text, i));
            }
          }
        }
      }
      var lesson = Lesson(number, el.getAttribute("name"), lessonsComponents);
      number++;
      lessons.add(lesson);
      print("\n\n");
    }
    return null;
  }

}
