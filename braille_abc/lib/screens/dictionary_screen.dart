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
              leading: Icon(
                CupertinoIcons.textformat,
                size: 35,
                color: Colors.orangeAccent,
              ),
              title: Text(
                "Русский алфавит",
                style: TextStyle(fontSize: 23),
              ),
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StudyItem(str: "А: точки 1"),
                    StudyItem(str: "Б: точки 1, 2"),
                    StudyItem(str: "В: точки 2, 4, 5, 6"),
                  ],
                ),
              ],
            ),
            Divider(color: CupertinoColors.secondaryLabel),
            ExpansionTile(
              leading: Icon(
                CupertinoIcons.textformat_abc,
                size: 35,
                color: Colors.orangeAccent,
              ),
              title: Text(
                "Английский алфавит",
                style: TextStyle(fontSize: 23),
              ),
              children: <Widget>[
                Text("................................................"),
              ],
            ),
            Divider(color: CupertinoColors.secondaryLabel),
            ExpansionTile(
              leading: Icon(
                CupertinoIcons.number,
                size: 35,
                color: Colors.orangeAccent,
              ),
              title: Text(
                "Цифры",
                style: TextStyle(fontSize: 23),
              ),
              children: <Widget>[],
            ),
            Divider(color: CupertinoColors.secondaryLabel),
            ExpansionTile(
              leading: Icon(
                CupertinoIcons.exclamationmark,
                size: 35,
                color: Colors.orangeAccent,
              ),
              title: Text(
                "Знаки препинания",
                style: TextStyle(fontSize: 23),
              ),
              children: <Widget>[
                Text("................................................"),
              ],
            ),
            Divider(color: CupertinoColors.secondaryLabel),
            ExpansionTile(
              leading: Icon(
                CupertinoIcons.plus_slash_minus,
                size: 35,
                color: Colors.orangeAccent,
              ),
              title: Text(
                "Арифметические знаки",
                style: TextStyle(fontSize: 23),
              ),
              children: <Widget>[
                Text("................................................"),
              ],
            ),
            Divider(color: CupertinoColors.secondaryLabel),
            ExpansionTile(
              leading: Icon(
                CupertinoIcons.square_grid_2x2,
                size: 35,
                color: Colors.orangeAccent,
              ),
              title: Text(
                "Признаки",
                style: TextStyle(fontSize: 23),
              ),
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
