import 'package:braille_abc/components/study_item_widget.dart';
import 'package:braille_abc/models/section_model.dart';
import 'package:braille_abc/screens/dictionary_screen.dart';
import 'package:braille_abc/screens/home_screen.dart';
import 'package:braille_abc/screens/practice_screen.dart';
import 'package:braille_abc/screens/settings_screen.dart';
import 'package:braille_abc/screens/study_screen.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';
import 'package:flutter/cupertino.dart';
import 'package:braille_abc/symbol/list_symbols.dart';


import 'menu_button.dart';
import 'section_model.dart';

class AppModel {

  final Alphabet alph = Alphabet();
  List<StructSymbol> rusalph;

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
          //List<StructSymbol> list = alph.listOfSymbols("Русский алфавит");
          for(int i = 0; i < rusalph.length; i++){
            StudyItem(str: rusalph[i].toString());
          }
          /*StudyItem(str: "А: точки 1"),
          StudyItem(str: "Б: точки 1, 2"),
          StudyItem(str: "В: точки 2, 4, 5, 6"),
          StudyItem(str: "Г: точки 1, 2, 4, 5"),
          StudyItem(str: "Д: точки 1, 4, 5"),
          StudyItem(str: "Е: точки 1, 5"),
          StudyItem(str: "Ё: точки 1, 6"),
          StudyItem(str: "Ж: точки 2, 4, 5"),
          StudyItem(str: "З: точки 1, 3, 5, 6"),
          StudyItem(str: "И: точки 2, 4"),
          StudyItem(str: "Й: точки 1, 2, 3, 4, 6"),
          StudyItem(str: "К: точки 1, 3"),
          StudyItem(str: "Л: точки 1, 2, 3"),
          StudyItem(str: "М: точки 1, 3, 4"),
          StudyItem(str: "Н: точки 1, 3, 4, 5"),
          StudyItem(str: "О: точки 1, 3, 5"),
          StudyItem(str: "П: точки 1, 2, 3, 4"),
          StudyItem(str: "Р: точки 1, 2, 3, 5"),
          StudyItem(str: "С: точки 2, 3, 4"),
          StudyItem(str: "Т: точки 2, 3, 4, 5"),
          StudyItem(str: "У: точки 1, 3, 6"),
          StudyItem(str: "Ф: точки 1, 2, 4"),
          StudyItem(str: "Х: точки 1, 2, 5"),
          StudyItem(str: "Ц: точки 1, 4"),
          StudyItem(str: "Ч: точки 1, 2, 3, 4, 5"),
          StudyItem(str: "Ш: точки 1, 4, 5"),
          StudyItem(str: "Щ: точки 1, 3, 4, 6"),
          StudyItem(str: "Ъ: точки 1, 2, 3, 5, 6"),
          StudyItem(str: "Ы: точки 2, 3, 4, 6"),
          StudyItem(str: "Ь: точки 2, 3, 4, 5, 6"),
          StudyItem(str: "Э: точки 2, 4, 6"),
          StudyItem(str: "Ю: точки 1, 2, 5, 6"),
          StudyItem(str: "Я: точки 1, 2, 4, 6"),*/
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
