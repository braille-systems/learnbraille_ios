import 'package:braille_ios_app/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_ios_app/components/navigation_bar_widget.dart';

class LetterScreen extends StatefulWidget {
  @override
  _LetterScreenState createState() => _LetterScreenState();
}

class _LetterScreenState extends State<LetterScreen> {
  final String str = "Просмотр символа";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: NavigationBar(title: str),
      child:
        Column(
          children: [
            SizedBox(
              height: ScreenParams.height(10, context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: ScreenParams.height(4, context),
                ),
                RaisedButton(

                  padding: EdgeInsetsDirectional.only(start: 0),
                  onPressed: null,
                  child: Container(
                    width: ScreenParams.width(70, context),
                    height: ScreenParams.height(30, context),
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      border: Border.all(color: Colors.black, width: 7.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: ScreenParams.height(3, context),
                          ),
                          Text(
                            'Русский Алфавит',
                            style:
                            TextStyle(fontSize: 30.0, color: CupertinoColors.black, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'А',
                            style: TextStyle(
                                color: CupertinoColors.black,
                                fontSize: 120,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )

                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenParams.height(10, context),
                ),
              ]),
        ],
        ),

    );
  }
}
