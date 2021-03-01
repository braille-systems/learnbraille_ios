import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/components/study_item_widget.dart';
import 'package:flutter/cupertino.dart';

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
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StudyItem(str: "А: точки 1"),
          StudyItem(str: "Б: точки 1, 2"),
          StudyItem(str: "В: точки 2, 4, 5, 6"),
        ],
      )),
    );
  }
}
