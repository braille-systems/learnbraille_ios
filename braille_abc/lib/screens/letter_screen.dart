import 'package:braille_abc/components/help_widgets.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/screens/dictionary_screen.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/components/letter_widget.dart';
import 'package:braille_abc/symbol/image_symbol.dart';

import '../style.dart';

class LetterScreen extends StatefulWidget {
  LetterScreen({Key key, @required this.titleSymbol, @required this.symbol}) : super(key: key);

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
  }

  TextDirection mode() {
    return _dir;
  }

  @override
  Widget build(BuildContext context) {
    TextDirection mode() {
      return _dir;
    }

    return CupertinoPageScaffold(
      navigationBar: NavigationBar(
        title: widget.str,
        previousPage: DictionaryScreen(),
        helpPage: LetterViewHelp(),
        currentPage: LetterScreen(
          titleSymbol: widget.titleSymbol,
          symbol: widget.symbol,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: ScreenParams.height(5, context),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Semantics(
                  button: false,
                  child: LetterWidget(
                    title: widget.titleSymbol,
                    symbol: widget.symbol,
                  ),
                )

              ]),
          SizedBox(
            height: ScreenParams.height(5, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: CupertinoColors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  textStyle: TextStyle(
                    color: CupertinoColors.white,
                    shadows: <Shadow>[
                      Styles.buildButtonShadow(),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(vertical: ScreenParams.width(25, context)),
                ),
                onPressed: () => setState(() {
                  if (this._dir == TextDirection.ltr)
                    this._dir = TextDirection.rtl;
                  else if (this._dir == TextDirection.rtl) this._dir = TextDirection.ltr;
                }),
                child: Icon(
                  CupertinoIcons.arrow_right_arrow_left,
                  color: CupertinoColors.white,
                  semanticLabel: "Изменить режим",
                ),
              ),
              SymbolWidget(textDir: mode, char: widget.symbol, isTapped: false, width: 200, height: 350, dictSection: widget.titleSymbol),
              SizedBox(
                height: ScreenParams.width(60, context),
                width: ScreenParams.height(8, context),
              ),
              // change_mode_widget
            ],
          )
        ],
      ),
    );
  }
}
