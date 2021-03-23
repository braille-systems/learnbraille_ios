import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/components/help_widgets.dart';
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

enum navigation { MainMenu, StudyScreen, PracticeScreen, DictionaryScreen, SettingsScreen }

class AppModel {
  static final Alphabet _alphabet = Alphabet();

  static final List<MenuButton> menuButton = [
    MenuButton(name: ScreenNames.getName(ScreenType.Study), icon: AppIcon.getIcon(AppIcons.StudyScreen)),
    MenuButton(name: ScreenNames.getName(ScreenType.Practice), icon: AppIcon.getIcon(AppIcons.PracticeScreen)),
    MenuButton(name: ScreenNames.getName(ScreenType.Dictionary), icon: AppIcon.getIcon(AppIcons.DictionaryScreen)),
    MenuButton(name: ScreenNames.getName(ScreenType.Settings), icon: AppIcon.getIcon(AppIcons.SettingsScreen)),
  ];

  static final List<MenuButton> practiceButtons = [
    MenuButton(name: SectionNames.getName(SectionType.RussianSymbols), icon: AppIcon.getIcon(AppIcons.RussianAlphabetSection)),
    MenuButton(name: SectionNames.getName(SectionType.Numbers), icon: AppIcon.getIcon(AppIcons.NumbersSection)),
    MenuButton(name: SectionNames.getName(SectionType.PunctuationSymbols), icon: AppIcon.getIcon(AppIcons.PunctuationSymbolsSection)),
    MenuButton(name: SectionNames.getName(SectionType.ArithmeticSymbols), icon: AppIcon.getIcon(AppIcons.ArithmeticSymbolsSection)),
    MenuButton(name: SectionNames.getName(SectionType.Signs), icon: AppIcon.getIcon(AppIcons.SignsSection)),
  ];

  static final Widget _menuScreen = MenuScreen(
    previousPage: null,
    helpPage: MainMenuHelp(),
  );

  static final Widget _studyScreen = StudyScreen(
    previousPage: _menuScreen,
    helpPage: null,
  );

  static final Widget _practiceScreen = PracticeScreen(
      previousPage: _menuScreen,
      helpPage: null
  );

  static final Widget _dictionaryScreen = DictionaryScreen(
    previousPage: _menuScreen,
    helpPage: DictionaryHelp(),
  );

  static final Widget _settingsScreen = SettingsScreen(
      previousPage: _menuScreen,
      helpPage: null
  );

  static final Map<navigation, Widget> navigationScreens = {
    navigation.MainMenu: _menuScreen,
    navigation.StudyScreen: _studyScreen,
    navigation.PracticeScreen: _practiceScreen,
    navigation.DictionaryScreen: _dictionaryScreen,
    navigation.SettingsScreen: _settingsScreen
  };

  static final List<SectionModel> sections = [
    SectionModel(
      name: SectionNames.getName(SectionType.RussianSymbols),
      icon: AppIcon.getIcon(AppIcons.RussianAlphabetSection),
      expandedList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _alphabet.listOfStudyItems(SectionType.RussianSymbols),
      ),
    ),
    SectionModel(
      name: SectionNames.getName(SectionType.Numbers),
      icon: AppIcon.getIcon(AppIcons.NumbersSection),
      expandedList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _alphabet.listOfStudyItems(SectionType.Numbers),
      ),
    ),
    SectionModel(
      name: SectionNames.getName(SectionType.PunctuationSymbols),
      icon: AppIcon.getIcon(AppIcons.PunctuationSymbolsSection),
      expandedList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _alphabet.listOfStudyItems(SectionType.PunctuationSymbols),
      ),
    ),
    SectionModel(
      name: SectionNames.getName(SectionType.ArithmeticSymbols),
      icon: AppIcon.getIcon(AppIcons.ArithmeticSymbolsSection),
      expandedList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _alphabet.listOfStudyItems(SectionType.ArithmeticSymbols),
      ),
    ),
    SectionModel(
      name: SectionNames.getName(SectionType.Signs),
      icon: AppIcon.getIcon(AppIcons.SignsSection),
      expandedList: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _alphabet.listOfStudyItems(SectionType.Signs),
      ),
    ),
  ];
}
