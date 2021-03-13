import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:flutter/cupertino.dart';

class StudyScreen extends StatelessWidget {
  static bool isBottomBarDisplayed = true;

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
          "Обучение",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(CupertinoIcons.question_circle),
      ),
      child: SafeArea(
        child: Center(child: Text('Study')),
      ),
    );
  }
}
