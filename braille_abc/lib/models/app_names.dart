import 'package:braille_abc/models/lesson_model.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:flutter/cupertino.dart';

enum SectionType { RussianSymbols, Numbers, ArithmeticSymbols, PunctuationSymbols, Signs, Other }

@immutable
class SectionNames {
  static const Map<SectionType, String> stringOfSectionsMap = {
    SectionType.RussianSymbols: "Русский алфавит",
    SectionType.Numbers: "Цифры",
    SectionType.ArithmeticSymbols: "Арифметические знаки",
    SectionType.PunctuationSymbols: "Знаки препинания",
    SectionType.Signs: "Признаки",
    SectionType.Other: "",
  };

  static String getName(SectionType type) {
    return stringOfSectionsMap[type];
  }

  static SectionType getType(String text) {
    if (text.contains("RussianSymbols")) {
      return SectionType.RussianSymbols;
    }
    if (text.contains("Numbers")) {
      return SectionType.Numbers;
    }
    if (text.contains("ArithmeticSymbols")) {
      return SectionType.ArithmeticSymbols;
    }
    if (text.contains("PunctuationSymbols")) {
      return SectionType.PunctuationSymbols;
    }
    if (text.contains("Signs")) {
      return SectionType.Signs;
    }
    return null;
  }
}

enum ScreenType {
  Dictionary,
  Help,
  Home,
  Letter,
  Practice,
  Settings,
  Study,
  Results,
  Lesson,
  StudyList,
  About,
  EndOfLesson,
}

@immutable
class ScreenNames {
  static const Map<ScreenType, String> stringOfScreensMap = {
    ScreenType.Dictionary: "Словарь",
    ScreenType.Help: "Справка",
    ScreenType.Home: "Меню",
    ScreenType.Letter: "Просмотр символа",
    ScreenType.Practice: "Практика",
    ScreenType.Settings: "Настройки",
    ScreenType.Study: "Обучение",
    ScreenType.StudyList: "Список уроков",
    ScreenType.Lesson: "Урок",
    ScreenType.Results: "Результаты",
    ScreenType.About: "О нас",
    ScreenType.EndOfLesson: "Конец урока",
  };

  static String getName(ScreenType type) {
    return stringOfScreensMap[type];
  }
}

enum SettingType { OnlyLearned, Vibration, AutoVoice, About }

class SettingInfo {
  final String settingName;
  final String settingDescription;

  const SettingInfo({this.settingName, this.settingDescription});
}

@immutable
class SettingsNames {
  static const Map<SettingType, SettingInfo> stringOfSettingsMap = {
    SettingType.OnlyLearned: SettingInfo(
      settingName: "Повторять только изученное",
      settingDescription: "В разделе \"Практика\" повторять только символы, пройденные в разделе \"Обучение\"",
    ),
    SettingType.Vibration: SettingInfo(
      settingName: "Вибрация",
      settingDescription: "Результат выполнения задачи в \"Практике\" показывать с помощью вибрации",
    ),
    SettingType.AutoVoice: SettingInfo(
      settingName: "Автоозвучка текстов",
      settingDescription:
          "Автоматически озвучивать тексты (например, задания, справку) средством экранного чтения не дожидаясь"
          " фокусировки на текстовом поле",
    ),
    SettingType.About: SettingInfo(
      settingName: "О нас",
      settingDescription: "Контактная информация разработчиков данного приложения",
    )
  };

  static SettingInfo getName(SettingType settingType) {
    return stringOfSettingsMap[settingType];
  }
}

enum XmlItemType {
  MainMenu,
  GeneralHelp,
  Alphabet,
  SymbolView,
  PracticeSections,
  PracticeResult,
  StudyScreen,
  ReadingLessonScreen,
  TextLessonScreen,
  PracticeLessonScreen,
  About,
  Settings,
  EndLesson,
  EndStudy,
}

@immutable
class XmlNames {
  static const Map<XmlItemType, String> stringOfXmlItemMap = {
    XmlItemType.Alphabet: "Алфавит",
    XmlItemType.GeneralHelp: "Общая справка",
    XmlItemType.MainMenu: "Главное меню",
    XmlItemType.SymbolView: "Просмотр символа",
    XmlItemType.PracticeSections: "Разделы практики",
    XmlItemType.PracticeResult: "Результаты",
    XmlItemType.StudyScreen: "Список уроков",
    XmlItemType.PracticeLessonScreen: "Шаг с вводом",
    XmlItemType.ReadingLessonScreen: "Шаг с чтением",
    XmlItemType.TextLessonScreen: "Шаг с текстом",
    XmlItemType.About: "О нас",
    XmlItemType.Settings: "Настройки",
    XmlItemType.EndStudy: "Конец обучения",
    XmlItemType.EndLesson: "Конец урока",
  };

  static String getName(XmlItemType type) {
    return stringOfXmlItemMap[type];
  }
}

enum SemanticsType {
  ChangeMode,
  Back,
  Dot,
  Painted,
  NotPainted,
  Continue,
  ExpandableList,
  TapToOpen,
  BackToMainMenu,
  Results,
  Selected,
  NotSelected,
  Hint,
  ChosenMode,
  Reading,
  Writing,
  SectionInLetterWidget,
  SymbolInLetterWidget,
  Button,
  Available,
  NotAvailable,
  NumberLessonInStudy,
  ThemeOfLessonInStudy,
  BackForthButton,
}

@immutable
class SemanticNames {
  static const Map<SemanticsType, String> stringOfSemanticsMap = {
    SemanticsType.ChangeMode: "Изменить режим. Кнопка.",
    SemanticsType.Back: "Назад",
    SemanticsType.Dot: "Точка",
    SemanticsType.Painted: "закрашена",
    SemanticsType.NotPainted: "не закрашена",
    SemanticsType.Continue: "Продолжить",
    SemanticsType.ExpandableList: "выпадающий список.",
    SemanticsType.TapToOpen: "Нажмите, чтобы открыть.",
    SemanticsType.BackToMainMenu: "Вернуться в главное меню",
    SemanticsType.Results: "Результаты",
    SemanticsType.Selected: " выбрано",
    SemanticsType.NotSelected: " не выбрано",
    SemanticsType.Hint: "Подсказка",
    SemanticsType.ChosenMode: "Сейчас выбран режим ",
    SemanticsType.Reading: "чтения",
    SemanticsType.Writing: "записи",
    SemanticsType.SectionInLetterWidget: "Раздел: ",
    SemanticsType.SymbolInLetterWidget: "Символ: ",
    SemanticsType.Button: "Кнопка.",
    SemanticsType.Available: "Доступна",
    SemanticsType.NotAvailable: "Не доступна",
    SemanticsType.NumberLessonInStudy: "Урок номер: ",
    SemanticsType.ThemeOfLessonInStudy: "Тема: ",
    SemanticsType.BackForthButton: "Вернуться назад"
  };

  static String getName(SemanticsType type) {
    return stringOfSemanticsMap[type];
  }
}

enum ResultsPositions {
  StepCounter,
  CorrectAnswers,
  HintCounter,
  GeneralInfo,
}

class ResultsPair {
  ResultsPair(this.name, this.value);

  final String name;
  int value;
}

class ResultsInfo {
  ResultsInfo(Results results) {
    _resultsMap = {
      ResultsPositions.StepCounter: ResultsPair("Всего пройдено:", results.stepCounter),
      ResultsPositions.CorrectAnswers: ResultsPair("Верно:", results.correctAnswerCounter),
      ResultsPositions.HintCounter: ResultsPair("Подсказок использовано:", results.hintCounter),
      ResultsPositions.GeneralInfo: ResultsPair("Общие результаты:", 0),
    };
  }

  ResultsPair getResultsInfo(ResultsPositions position) => _resultsMap[position];

  String getFullResultInfo() {
    String result = '';
    for (var position in getDetailPositionsPool()) {
      ResultsPair resPair = _resultsMap[position];
      result += resPair.name + ": " + resPair.value.toString() + ".\n";
    }

    return result;
  }

  List<ResultsPositions> getDetailPositionsPool() =>
      [ResultsPositions.StepCounter, ResultsPositions.CorrectAnswers, ResultsPositions.HintCounter];

  Map<ResultsPositions, ResultsPair> _resultsMap;
}

@immutable
class LessonNames {
  static const Map<lessonType, String> stringOfLessonsMap = {
    lessonType.text: "текст",
    lessonType.reading: "чтение",
    lessonType.practice: "практика"
  };

  static String getName(lessonType type) {
    return stringOfLessonsMap[type];
  }

  static String getGeneralName(lessonType type) {
    return "Урок";
  }
}

enum lessonNumber {
  lesson,
  lessonStep,
}

@immutable
class LessonNums {
  static const Map<lessonNumber, String> stringOfLessonsMap = {
    lessonNumber.lessonStep: "lessonNumber",
    lessonNumber.lesson: "parentLessonNumber",
  };

  static String getName(lessonNumber type) {
    return stringOfLessonsMap[type];
  }
}

enum AfterStudy {
  AfterLesson,
  AfterCourse,
}

@immutable
class AfterStudyText {
  static const Map<AfterStudy, String> _map = {
    AfterStudy.AfterLesson: "К следующему уроку",
    AfterStudy.AfterCourse: "Вернуться в главное меню",
  };

  static String textAfterLesson(int lessonNumber, String lessonName) =>
      "Поздравляем! Вы закончили прохождение урока $lessonNumber: \" $lessonName \".";

  static String textAfterCourse(int lessonNumber, String lessonName) =>
      textAfterLesson(lessonNumber, lessonName) + " На этом обучение шрифту Брайля завершается.";

  static String getButtonName(AfterStudy afterStudy) => _map[afterStudy];
}
