import 'package:braille_abc/components/help_widgets.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/models/section_model.dart';
import 'package:braille_abc/screens/dictionary_screen.dart';
import 'package:braille_abc/screens/help_screen.dart';
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

  static final Widget menuScreen = MenuScreen(
    previousPage: null,
    helpPage: MainMenuHelp(),
  );

  static final Widget studyScreen = StudyScreen(
    previousPage: menuScreen,
    helpPage: null,
  );

  static final Widget practiceScreen = PracticeScreen(previousPage: menuScreen, helpPage: null);

  static final Widget dictionaryScreen = DictionaryScreen(
    previousPage: menuScreen,
    helpPage: DictionaryHelp(),
  );

  static final Widget settingsScreen = SettingsScreen(previousPage: menuScreen, helpPage: null);

  static final Map<String, Widget> navigationScreens = {
    "MainMenu": menuScreen,
    "StudyScreen": studyScreen,
    "PracticeScreen": practiceScreen,
    "DictionaryScreen": dictionaryScreen,
    "SettingsScreen": settingsScreen
  };

  static final List<Widget> navigationScreensList = [
    menuScreen,
    studyScreen,
    practiceScreen,
    dictionaryScreen,
    settingsScreen
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
    SectionModel(
      name: "Цифры",
      icon: CupertinoIcons.textformat_123,
      expandedList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _alphabet.listOfStudyItems("Цифры"),
      ),
    ),
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
    SectionModel(
      name: "Признаки",
      icon: CupertinoIcons.square_grid_2x2,
      expandedList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _alphabet.listOfStudyItems("Признаки"),
      ),
    ),
  ];
}
