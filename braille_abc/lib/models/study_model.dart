import 'package:braille_abc/components/lesson_buttons.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
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
class LessonComponents extends StatelessWidget {
  final int number;
  final lessonType type;
  final String text;

  LessonComponents(this.type, this.text, this.number);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

@immutable
class PracticeLesson extends LessonComponents {
  final String symbol;

  PracticeLesson(lessonType type, String text, this.symbol, int num) : super(type, text, num);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Раздел в разработке...')),
    );
  }
}

@immutable
class ReadingLesson extends LessonComponents {
  final String symbol;

  ReadingLesson(lessonType type, String text, this.symbol, int num) : super(type, text, num);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Раздел в разработке...')),
    );
  }
}

@immutable
class TextLesson extends LessonComponents {
  TextLesson(lessonType type, String text, int num) : super(type, text, num);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenParams.heightIOS14(100, context),
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              SizedBox(
                height: ScreenParams.width(90, context),
              ),
              SizedBox(
                height: ScreenParams.width(60, context),
                width: ScreenParams.width(15, context),
                child: BackForthButton(type: lessonButtonType.backward),
              ),
            ],
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Html(
                    data: text,
                    defaultTextStyle: TextStyle(fontSize: 30),
                  ))),
          Column(
            children: [
              SizedBox(
                height: ScreenParams.width(90, context),
              ),
              SizedBox(
                height: ScreenParams.width(60, context),
                width: ScreenParams.width(15, context),
                child: BackForthButton(type: lessonButtonType.forward),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

@immutable
class StudyModel {
  static int number = 1;
  static final List<Lesson> lessons = [];
  static int currentLessonPart = 0;
  static int currentLesson = 0;

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
            } else if (type == "info") {
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
