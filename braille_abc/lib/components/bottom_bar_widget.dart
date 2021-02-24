import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_ios_app/models/menu_button.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
    @required this.menuButton,
  }) : super(key: key);

  final List<MenuButton> menuButton;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 45,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: CupertinoColors.activeBlue,
      unselectedItemColor: CupertinoColors.systemGrey,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: CupertinoColors.lightBackgroundGray,
          icon: Icon(CupertinoIcons.bars),
          label: 'Меню',
        ),
        for (int i = 0; i < menuButton.length; i++)
          BottomNavigationBarItem(
            backgroundColor: CupertinoColors.lightBackgroundGray,
            icon: Icon(menuButton[i].icon),
            label: menuButton[i].name,
          ),
      ],
    );
  }
}
