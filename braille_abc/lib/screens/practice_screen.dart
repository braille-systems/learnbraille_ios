import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:braille_abc/models/enums_model.dart';

class PracticeScreen extends StatelessWidget {
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
          StringOfScreensMap[ScreenType.Practice],
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
