import 'package:braille_abc/components/expandable_list_widget.dart';
import 'package:braille_abc/components/help_widgets.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/models/enums_model.dart';

class DictionaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: NavigationBar(
        previousPage: HomeScreen(),
        currentPage: DictionaryScreen(),
        helpPage: DictionaryHelp(),
        title: StringOfScreensMap[ScreenType.Dictionary],
      ),
      child: SingleChildScrollView(
          child: MyExpandableList(
        model: AppModel.sections,
      )), //Wrapped into SingleChildScrollView because when click on TextField  keyboard will open and you may get error on screen "bottom overflowed by pixels flutter"
    );
  }
}
