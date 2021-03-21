import 'package:braille_abc/models/enums_model.dart';
import 'package:braille_abc/models/section_model.dart';
import 'package:braille_abc/screens/dictionary_screen.dart';
import 'package:braille_abc/screens/home_screen.dart';
import 'package:braille_abc/screens/practice_screen.dart';
import 'package:braille_abc/screens/settings_screen.dart';
import 'package:braille_abc/screens/study_screen.dart';
import 'package:braille_abc/symbol/list_symbols.dart';
import 'package:flutter/cupertino.dart';

import 'menu_button.dart';
import 'section_model.dart';

class AppModel {
  static final Alphabet _alphabet = Alphabet();
  static final List<MenuButton> menuButton = [
    MenuButton(name: "Обучение", icon: CupertinoIcons.book),
    MenuButton(name: "Практика", icon: CupertinoIcons.circle_grid_3x3_fill),
    MenuButton(name: "Словарь", icon: CupertinoIcons.textformat),
    MenuButton(name: "Настройки", icon: CupertinoIcons.settings),
  ];

  static final List<Widget> screens = [
    MenuScreen(),
    StudyScreen(),
    PracticeScreen(),
    DictionaryScreen(),
    SettingsScreen(),
  ];

  static final List<SectionModel> sections = [
    SectionModel(
      name: StringOfSectionsMap[SectionType.RussianSymbols],
      icon: CupertinoIcons.textformat,
      expandedList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _alphabet.listOfStudyItems(SectionType.RussianSymbols),
      ),
    ),
    SectionModel(
      name: StringOfSectionsMap[SectionType.Numbers],
      icon: CupertinoIcons.textformat_123,
      expandedList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _alphabet.listOfStudyItems(SectionType.Numbers),
      ),
    ),
    SectionModel(
      name: StringOfSectionsMap[SectionType.PunctuationSymbols],
      icon: CupertinoIcons.exclamationmark,
      expandedList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _alphabet.listOfStudyItems(SectionType.PunctuationSymbols),
      ),
    ),
    SectionModel(
      name: StringOfSectionsMap[SectionType.ArithmeticSymbols],
      icon: CupertinoIcons.plus_slash_minus,
      expandedList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _alphabet.listOfStudyItems(SectionType.ArithmeticSymbols),
      ),
    ),
    SectionModel(
      name: StringOfSectionsMap[SectionType.Signs],
      icon: CupertinoIcons.square_grid_2x2,
      expandedList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _alphabet.listOfStudyItems(SectionType.Signs),
      ),
    ),
  ];
}
