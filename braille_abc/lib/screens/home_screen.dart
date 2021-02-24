import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:braille_abc/screens/practice_screen.dart';
import 'package:braille_abc/screens/settings_screen.dart';
import 'package:braille_abc/screens/study_screen.dart';
import 'package:braille_abc/screens/dictionary_screen.dart';

import 'package:braille_abc/components/menu_button_widget.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/menu_button.dart';
import 'package:braille_abc/shared/screen_params.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<Widget> _pages = [
    MenuScreen(),
    StudyScreen(),
    PracticeScreen(),
    DictionaryScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: CupertinoColors.lightBackgroundGray,
              icon: Icon(CupertinoIcons.bars),
              label: 'Меню',
            ),
            for (int i = 0; i < AppModel.menuButton.length; i++)
              BottomNavigationBarItem(
                backgroundColor: CupertinoColors.lightBackgroundGray,
                icon: Icon(AppModel.menuButton[i].icon),
                label: AppModel.menuButton[i].name,
              ),
          ],
        ),
        tabBuilder: (BuildContext context, index) {
          return _pages[index];
        });

  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ScreenParams.height(6, context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Меню",
                style: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 55,
                    fontWeight: FontWeight.bold),
              ),
              CupertinoButton(
                child: Icon(
                  CupertinoIcons.question_circle,
                  size: ScreenParams.height(5, context),
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: ScreenParams.height(5, context)),
          SizedBox(
            height: ScreenParams.height(70, context),
            child: GridView.count(
              childAspectRatio: (50 / 65),
              mainAxisSpacing: ScreenParams.height(3, context),
              crossAxisSpacing: ScreenParams.height(2, context),
              crossAxisCount: 2,
              children: <Widget>[
                for (int i = 0; i < AppModel.menuButton.length; i++)
                  MenuButtonWidget(
                    menuButton: MenuButton(
                        name: AppModel.menuButton[i].name,
                        icon: AppModel.menuButton[i].icon),
                  ),
              ],
            ),
          )
        ],
      ),
    ),
    );
  }
}







