import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:flutter/cupertino.dart';

class PracticeScreen extends NavigationScreen {
  const PracticeScreen({
    Key key,
    Widget helpPage,
    Widget previousPage,
  }) : super(
    key: key,
    helpPage: helpPage,
    previousPage: previousPage,
  );
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Semantics(
            label: "Назад",
            button: true,
            child: CupertinoNavigationBarBackButton(
              onPressed: () {
                scakey.currentState.onItemTapped(0);
              },
            )),
        middle: Text(
          "Практика",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(CupertinoIcons.question_circle),
      ),
      child: SafeArea(
        child: Center(child: Text('practice')),
      ),
    );
  }
}
