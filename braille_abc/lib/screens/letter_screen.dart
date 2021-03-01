import 'package:braille_abc/screens/dictionary_screen.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/components/letter_widget.dart';
import 'package:braille_abc/symbol/image_symbol.dart';
import 'dart:math' as math;

class LetterScreen extends StatefulWidget {
  LetterScreen({Key key, @required this.titleSymbol, @required this.symbol})
      : super(key: key);

  final String str = "Просмотр символа";
  final String titleSymbol;
  final String symbol;

  @override
  _LetterScreenState createState() => _LetterScreenState();
}

class _LetterScreenState extends State<LetterScreen> {
  TextDirection _dir = TextDirection.ltr;

  @override
  void initState() {
    super.initState();
    print("InitState");
  }

  TextDirection mode() {
    return _dir;
  }

  @override
  Widget build(BuildContext context) {
    print("Build");

    TextDirection mode() {
      return _dir;
    }

    return CupertinoPageScaffold(
      navigationBar: NavigationBar(
        title: widget.str,
        previousPage: DictionaryScreen(),
      ),
      child: Column(
        children: [
          SizedBox(
            height: ScreenParams.height(5, context),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LetterWidget(
                  title: widget.titleSymbol,
                  symbol: widget.symbol,
                ),
              ]),
          SizedBox(
            height: ScreenParams.height(5, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.baseline,
            // textBaseline: TextBaseline.alphabetic,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: ScreenParams.height(10, context),
                width: ScreenParams.width(25, context),
              ),
              Symbol(
                  dir: mode,
                  char: widget.symbol,
                  tap: false,
                  width: 200,
                  height: 350,
                  locationY: 0.5,
                  locationX: 0.0),
              SizedBox(
                height: ScreenParams.height(10, context),
                width: ScreenParams.width(25, context),
              ),

              // change_mode_widget(черная кнопка) я пока вынес сюда
              Container(
                  padding: EdgeInsets.fromLTRB(
                      0, 0, 0, ScreenParams.height(15, context)),
                  width: ScreenParams.width(40, context),
                  transform: Matrix4.rotationZ(math.pi / 2),
                  child: CupertinoButton(
                      child: Icon(
                        CupertinoIcons.arrow_up_arrow_down,
                        color: CupertinoColors.white,
                        size: 35,
                        semanticLabel: "Изменить режим",
                      ),
                      disabledColor: CupertinoColors.black,
                      color: CupertinoColors.black,
                      onPressed: () => setState(() {
                            if (this._dir == TextDirection.ltr)
                              this._dir = TextDirection.rtl;
                            else if (this._dir == TextDirection.rtl)
                              this._dir = TextDirection.ltr;
                          }))),
            ],
          )
        ],
      ),
    );
  }
}
