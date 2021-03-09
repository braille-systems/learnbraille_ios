import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/components/expandable_list_widget.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DictionaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            scakey.currentState.onItemTapped(0);
          },
        ),
        middle: Text(
          "Словарь",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(CupertinoIcons.question_circle),
      ),
      child: SingleChildScrollView(
          child:
              MyExpandableList(model: AppModel.sections,)), //Wrapped into SingleChildScrollView because when click on TextField  keyboard will open and you may get error on screen "bottom overflowed by pixels flutter"
    );
  }
}
