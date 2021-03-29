import 'package:braille_abc/components/expandable_list_widget.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/screen_model.dart';

@immutable
class DictionaryScreen extends NavigationScreen {
  const DictionaryScreen({
    Key key,
    Widget helpPage,
    Widget previousPage,
  }) : super(key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: NavigationBar(
        currentPage: this,
        title: ScreenNames.getName(ScreenType.Dictionary),
      ),
      child: SingleChildScrollView(
          child: MyExpandableList(
        model: AppModel.sections,
      )), //Wrapped into SingleChildScrollView because when click on TextField  keyboard will open and you may get error on screen "bottom overflowed by pixels flutter"
    );
  }
}
