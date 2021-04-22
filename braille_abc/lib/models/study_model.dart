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
  final lessonType type;
  final String text;

  LessonComponents(this.type, this.text);
}

@immutable
class PracticeLesson extends LessonComponents {
  final String symbol;

  PracticeLesson(lessonType type, String text, this.symbol) : super(type, text);
}

@immutable
class ReadingLesson extends LessonComponents {
  final String symbol;

  ReadingLesson(lessonType type, String text, this.symbol) : super(type, text);
}

@immutable
class TextLesson extends LessonComponents {
  TextLesson(lessonType type, String text) : super(type, text);
}

@immutable
class StudyModel {
  static int number = 1;
  static final List<Lesson> lessons = [];

  // static final Map<String, Section> helpSection = Map();

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
      var components = el.children;
      for (var comp in components) {
        var type = comp.getAttribute("type");
        if (type != null) {
          if (type == "practice") {
            lessonsComponents.add(PracticeLesson(lessonType.practice, comp.getAttribute("title"), comp.text));
          } else if (type == "reading") {
            lessonsComponents.add(ReadingLesson(lessonType.practice, comp.getAttribute("title"), comp.text));
          }
        } else {
          lessonsComponents.add(TextLesson(lessonType.practice, comp.text));
        }
      }
      var lesson = Lesson(number, el.getAttribute("name"), lessonsComponents);
      lessons.add(lesson);
    }
    return null;
  }

 /* static List<Section> _parseButtonSection(Iterable<XmlNode> buttonSection) {
    List<Section> buttonSections = [];
    for (var el in buttonSection) {
      buttonSections.add(_getSection(el));
    }
    return buttonSections;
  }

  static Section _getSection(XmlElement el) {
    return Section(
      el.getAttribute('name'),
      _getHtmlDescription(el.findElements("text").first.nodes),
      _parseButtonSection(el.findElements("button")),
    );
  }

  static String _getHtmlDescription(Iterable<XmlNode> textNodes) {
    String htmlDescription = "";
    for (var el in textNodes) {
      htmlDescription += el.toString();
    }
    var str = htmlDescription.replaceAll("  ", "");
    return str;
  }
}

@immutable
class HelpModel {
  static final Map<String, Section> helpSection = Map();

  static Future<Null> fillHelpModel(BuildContext context) async {
    String xmlString = await DefaultAssetBundle.of(context).loadString("data/help.xml");
    var xml = XmlDocument.parse(xmlString);
    _parseXmlSection("general_button", xml);
    _parseXmlSection("section", xml);
    return null;
  }

  static Null _parseXmlSection(String sectionName, XmlDocument xml) {
    var sections = xml.findAllElements(sectionName);
    for (var el in sections) {
      helpSection[el.getAttribute('name')] = _getSection(el);
    }
    return null;
  }

  static List<Section> _parseButtonSection(Iterable<XmlNode> buttonSection) {
    List<Section> buttonSections = [];
    for (var el in buttonSection) {
      buttonSections.add(_getSection(el));
    }
    return buttonSections;
  }

  static Section _getSection(XmlElement el) {
    return Section(
      el.getAttribute('name'),
      _getHtmlDescription(el.findElements("text").first.nodes),
      _parseButtonSection(el.findElements("button")),
    );
  }

  static String _getHtmlDescription(Iterable<XmlNode> textNodes) {
    String htmlDescription = "";
    for (var el in textNodes) {
      htmlDescription += el.toString();
    }
    var str = htmlDescription.replaceAll("  ", "");
    return str;
  }*/
}
