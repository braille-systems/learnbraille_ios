import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/components/expandable_list_widget.dart';
import 'package:braille_abc/components/help_widgets.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'help_screen.dart';

class DictionaryScreen extends StatelessWidget {
  final bool isBottomBarDisplayed = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: NavigationBar(
        previousPage: HomeScreen(),
        currentPage: DictionaryScreen(),
        helpPage: DictionaryHelp(),
        title: "Словарь",
        isNavigationScreen: true,
      ),
      /*CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            scakey.currentState.onItemTapped(0);
          },
        ),
        middle: Text(
          "Словарь",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        trailing: CupertinoButton(
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
          ),
          child: Icon(CupertinoIcons.question_circle, size: 35),
          onPressed: () {
            scakey.currentState.displayTapBar(false);
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => HelpScreen(
                  helpWidget: DictionaryHelp(),
                ),
              ),
            );
          },
        ),
      ),*/

      child: SingleChildScrollView(
          child: MyExpandableList(
        model: AppModel.sections,
      )), //Wrapped into SingleChildScrollView because when click on TextField  keyboard will open and you may get error on screen "bottom overflowed by pixels flutter"
    );
  }
}
