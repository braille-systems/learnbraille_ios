import 'package:braille_abc/components/study_item_widget.dart';
import 'package:braille_abc/models/section_model.dart';
import 'package:braille_abc/screens/dictionary_screen.dart';
import 'package:braille_abc/screens/home_screen.dart';
import 'package:braille_abc/screens/practice_screen.dart';
import 'package:braille_abc/screens/settings_screen.dart';
import 'package:braille_abc/screens/study_screen.dart';
import 'package:flutter/cupertino.dart';

import 'menu_button.dart';
import 'section_model.dart';

class AppModel {
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

  // TODO: вынести все символы в свои списки - виджеты и передавать в expandedList в более удобном виде
  static final List<SectionModel> sections = [
    SectionModel(
      name: "Русский алфавит",
      icon: CupertinoIcons.textformat,
      expandedList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StudyItem(str: "А: точки 1"),
          StudyItem(str: "Б: точки 1, 2"),
          StudyItem(str: "В: точки 2, 4, 5, 6"),
        ],
      ),
    ),
    SectionModel(
        name: "Английский алфавит",
        icon: CupertinoIcons.textformat_abc,
        expandedList: Text("+")),
    SectionModel(
        name: "Цифры",
        icon: CupertinoIcons.textformat_123,
        expandedList: Text("+")),
    SectionModel(
        name: "Знаки препинания",
        icon: CupertinoIcons.exclamationmark,
        expandedList: Text("+")),
    SectionModel(
        name: "Арифметические знаки",
        icon: CupertinoIcons.plus_slash_minus,
        expandedList: Text("+")),
    SectionModel(
        name: "Признаки",
        icon: CupertinoIcons.square_grid_2x2,
        expandedList: Text("+")),
  ];
}
