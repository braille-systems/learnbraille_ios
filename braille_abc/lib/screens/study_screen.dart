import 'package:braille_abc/models/app_model.dart';
import 'package:flutter/cupertino.dart';

class StudyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => AppModel.screens[0],
              ),
            );
          },
        ),
        middle: Text(
          "Обучение",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(CupertinoIcons.question_circle),
      ),
      child: SafeArea(
        child: Center(child: Text('study')),
      ),
    );
  }
}
