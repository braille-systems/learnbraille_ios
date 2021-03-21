import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:flutter/cupertino.dart';

class SettingsScreen extends NavigationScreen {
  const SettingsScreen({
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
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            scakey.currentState.onItemTapped(0);
          },
        ),
        middle: Text(
          "Настройки",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(CupertinoIcons.question_circle),
      ),
      child: SafeArea(
        child: Center(child: Text('settings')),
      ),
    );
  }
}
