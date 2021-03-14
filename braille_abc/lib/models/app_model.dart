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
      name: "Русский алфавит",
      icon: CupertinoIcons.textformat,
      expandedList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _alphabet.listOfStudyItems("Русский алфавит"),
      ),
    ),
    SectionModel(name: "Цифры", icon: CupertinoIcons.textformat_123, expandedList: Text("+")),
    SectionModel(
      name: "Знаки препинания",
      icon: CupertinoIcons.exclamationmark,
      expandedList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _alphabet.listOfStudyItems("Знаки препинания"),
      ),
    ),
    SectionModel(
      name: "Арифметические знаки",
      icon: CupertinoIcons.plus_slash_minus,
      expandedList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _alphabet.listOfStudyItems("Арифметические знаки"),
      ),
    ),
    SectionModel(name: "Признаки", icon: CupertinoIcons.square_grid_2x2, expandedList: Text("+")),
  ];
}
