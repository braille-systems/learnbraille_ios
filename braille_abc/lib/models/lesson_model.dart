import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/study_model.dart';
import 'package:braille_abc/screens/letter_screen_study.dart';
import 'package:braille_abc/screens/study_screen.dart';
import 'package:braille_abc/symbol/list_symbols.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';
import 'package:flutter/cupertino.dart';

import 'package:braille_abc/models/app_names.dart';

enum lessonType {
  text,
  reading,
  practice,
}

@immutable
class Lesson {
  final int _number;
  final String _name;
  final List<LessonComponents> lessonComponent;

  int get number => _number;

  String get name => _name;

  LessonComponents getLessonComponent(int i) => lessonComponent[i];

  Lesson(this._number, this._name, this.lessonComponent);
}

@immutable
class LessonComponents extends StatelessWidget {
  final int _number;
  final lessonType _type;
  final String _text;

  int get number => _number;

  String get text => _text;

  lessonType get type => _type;

  LessonComponents(this._type, this._text, this._number);

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
    String up;
    String down;
    var lessonText = StudyModel.parseTitle(text);
    var studySymbol = StudyModel.parseSymbol(symbol);
    if (lessonText == null) {
      down = studySymbol.char;
      up = SectionNames.getName(SectionNames.getType(text));
    } else {
      up = lessonText[0] + ":";
      down = lessonText[1];
    }

    return LetterScreenStudy(
        isDotsTouchable: true,
        symbol: studySymbol ?? StudySymbol(list: Search.imageSymbol(d: StudyModel.createSymbol(symbol))),
        screenType: ScreenType.Study,
        sectionName: SectionType.ArithmeticSymbols,
        upperText: up,
        downText: down,
        helpPage: null,
        previousPage: AppModel.navigationScreens[navigation.StudyScreen]);
  }
}

@immutable
class ReadingLesson extends LessonComponents {
  final String symbol;

  ReadingLesson(lessonType type, String text, this.symbol, int num) : super(type, text, num);

  @override
  Widget build(BuildContext context) {
    String up;
    String down;
    var lessonText = StudyModel.parseTitle(text);
    var studySymbol = StudyModel.parseSymbol(symbol);
    if (lessonText == null) {
      down = studySymbol.char;
      up = SectionNames.getName(SectionNames.getType(text));
    } else {
      up = lessonText[0] + ":";
      down = lessonText[1];
    }

    return LetterScreenStudy(
        isDotsTouchable: false,
        symbol: studySymbol ?? StudySymbol(list: Search.imageSymbol(d: StudyModel.createSymbol(symbol))),
        screenType: ScreenType.Study,
        sectionName: SectionType.ArithmeticSymbols,
        upperText: up,
        downText: down,
        helpPage: null,
        previousPage: AppModel.navigationScreens[navigation.StudyScreen]);
  }
}

@immutable
class TextLesson extends LessonComponents {
  TextLesson(lessonType type, String text, int num) : super(type, text, num);

  @override
  Widget build(BuildContext context) {
    return TextLessonScreen(
      text,
      helpPage: null,
      previousPage: AppModel.navigationScreens[navigation.StudyScreen],
    );
  }
}
