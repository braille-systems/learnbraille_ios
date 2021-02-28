import 'package:flutter/cupertino.dart';

import 'menu_button.dart';

class AppModel {
  static final List<MenuButton> menuButton = [
    MenuButton(name: "Обучение", icon: CupertinoIcons.book),
    MenuButton(name: "Практика", icon: CupertinoIcons.circle_grid_3x3_fill),
    MenuButton(name: "Словарь", icon: CupertinoIcons.textformat),
    MenuButton(name: "Настройки", icon: CupertinoIcons.settings),
  ];
}
