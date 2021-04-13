import 'package:braille_abc/models/practice_model.dart';
import 'package:flutter/cupertino.dart';

enum SectionType { RussianSymbols, Numbers, ArithmeticSymbols, PunctuationSymbols, Signs }

@immutable
class SectionNames {
  static const Map<SectionType, String> stringOfSectionsMap = {
    SectionType.RussianSymbols: "Русский алфавит",
    SectionType.Numbers: "Цифры",
    SectionType.ArithmeticSymbols: "Арифметические знаки",
    SectionType.PunctuationSymbols: "Знаки препинания",
    SectionType.Signs: "Признаки"
  };

  static String getName(SectionType type) {
    return stringOfSectionsMap[type];
  }
}

enum ScreenType { Dictionary, Help, Home, Letter, Practice, Settings, Study, Results }

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
    ScreenType.Results: "Результаты",
  };

  static String getName(ScreenType type) {
    return stringOfScreensMap[type];
  }
}

enum XmlItemType { MainMenu, GeneralHelp, Alphabet, SymbolView, PracticeSections, PracticeResult }

@immutable
class XmlNames {
  static const Map<XmlItemType, String> stringOfXmlItemMap = {
    XmlItemType.Alphabet: "Алфавит",
    XmlItemType.GeneralHelp: "Общая справка",
    XmlItemType.MainMenu: "Главное меню",
    XmlItemType.SymbolView: "Просмотр символа",
    XmlItemType.PracticeSections: "Разделы практики",
    XmlItemType.PracticeResult: "Результаты",
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
  Writing
}

@immutable
class SemanticNames {
  static const Map<SemanticsType, String> stringOfSemanticsMap = {
    SemanticsType.ChangeMode: "Изменить режим",
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
      ResultsPositions.HintCounter: ResultsPair("Подсказок использовано:", 0),
      ResultsPositions.GeneralInfo: ResultsPair("Общие результаты:", 0),
    };
  }

  ResultsPair getResultsInfo(ResultsPositions position) => _resultsMap[position];

  List<ResultsPositions> getDetailPositionsPool() =>
      [ResultsPositions.StepCounter, ResultsPositions.CorrectAnswers, ResultsPositions.HintCounter];

  Map<ResultsPositions, ResultsPair> _resultsMap;
}
