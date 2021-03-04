import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/components/study_item_widget.dart';
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
              MyExpanableCardViewFlutter()), //Wrapped into SingleChildScrollView because when click on TextField  keyboard will open and you may get error on screen "bottom overflowed by pixels flutter"
    );
  }
}

class MyExpanableCardViewFlutter extends StatefulWidget {
  @override
  _MyExpanableCardViewFlutterState createState() =>
      _MyExpanableCardViewFlutterState();
}

class _MyExpanableCardViewFlutterState
    extends State<MyExpanableCardViewFlutter> {
  //controller for TextField
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: 0,
              height: 65,
            ),
            ExpansionTile(
              leading: Icon(CupertinoIcons.textformat),
              title: Text("Русский алфавит"),
              children: <Widget>[
                SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StudyItem(str: "А: точки 1"),
                        StudyItem(str: "Б: точки 1, 2"),
                        StudyItem(str: "В: точки 2, 4, 5, 6"),
                      ],
                    )),
              ],
            ),
            ExpansionTile(
              leading: Icon(CupertinoIcons.number),
              title: Text("Английский алфавит"),
              children: <Widget>[
                Text("................................................"),
              ],
            ),
            ExpansionTile(
              leading: Icon(CupertinoIcons.textformat),
              title: Text("Цифры"),
              children: <Widget>[

              ],
            ),
            ExpansionTile(
              leading: Icon(CupertinoIcons.textformat),
              title: Text("Знаки препинания"),
              children: <Widget>[
                Text("................................................"),
              ],
            ),
            ExpansionTile(
              leading: Icon(CupertinoIcons.textformat),
              title: Text("Арифметические знаки"),
              children: <Widget>[
                Text("................................................"),
              ],
            ),
            ExpansionTile(
              leading: Icon(CupertinoIcons.textformat),
              title: Text("Признаки"),
              children: <Widget>[
                Text("................................................"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


