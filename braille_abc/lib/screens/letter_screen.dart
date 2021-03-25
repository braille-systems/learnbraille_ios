import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/symbol/list_symbols.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/components/letter_widget.dart';
import 'package:braille_abc/symbol/image_symbol.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';
import 'dart:math';

import '../style.dart';

class LetterScreen extends SectionScreen {
  final String titleSymbol;
  final String symbol;
  final bool touchable;

  const LetterScreen({Key key, Screen helpPage, Screen previousPage, @required this.titleSymbol, @required this.symbol, @required this.touchable})
      : super(key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: NavigationBar(
          currentPage: this,
          title: "Просмотр символа",
        ),
        child: LetterView(
          titleSymbol: titleSymbol,
          symbol: symbol,
          touchable: touchable,
        ));
  }
}

class LetterView extends StatefulWidget {
  LetterView({Key key, @required this.titleSymbol, @required this.symbol, @required this.touchable}) : super(key: key);

  final String str = "Просмотр символа";
  String titleSymbol;
  String symbol;
  final bool touchable;

  @override
  _LetterViewState createState() => _LetterViewState();
}

class _LetterViewState extends State<LetterView> {

  _LetterViewState(){
    if(widget.touchable == true) {
      type = new PracticeSymbol();
      widget.symbol = type.getSymbol().char;
      widget.titleSymbol = type.titleSymbol();
    }
  }

  TextDirection _dir = TextDirection.ltr;
  NextSymbol type;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: ScreenParams.height(5, context),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
            Semantics(
              button: false,
              child: LetterWidget(
                title: widget.titleSymbol.toString(),
                symbol: widget.symbol.toString(),
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
              SymbolWidget(
                  textDir: mode,
                  char: widget.symbol,
                  isTapped: widget.touchable,
                  width: 200,
                  height: 350,
                  dictSection: widget.titleSymbol),
              SizedBox(
                height: ScreenParams.width(60, context),
                width: ScreenParams.height(8, context),
              ),
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
                  padding: EdgeInsets.symmetric(vertical: ScreenParams.width(40, context)),
                ),
                onPressed: !widget.touchable ? null : () => setState(() {
                  widget.symbol = type.getSymbol().char;
                  widget.titleSymbol = type.titleSymbol();
                }
                ),
                child: Icon(
                  CupertinoIcons.chevron_right_2,
                  color: CupertinoColors.white,
                ),
              )
              // change_mode_widget
            ],
          )
        ],
      ),
    );
  }
}

abstract class NextSymbol{

  final List<Symbol> data = <Symbol>[];

  Symbol getSymbol();
  String titleSymbol();
}

class PracticeSymbol extends NextSymbol{
  PracticeSymbol(){
    List<String> strings = Practice.getPool();
    SymbolsFactory factory = new SymbolsFactory();
    for(var i in strings){
      var group = factory.createSymbolsGroup(i);
      data.addAll(group);
      startGroup.add(data.length);
    }
  }

  Symbol getSymbol(){
    var rand = new Random();
    int num = rand.nextInt(data.length);
    Symbol symbol = data[num];
    int j = -1, q = 0;
    for(var i in startGroup){
      if(i > num){
        if(j == -1)
          j = q;
        startGroup[q]--;
      }
      q++;
    }
    title.clear();
    title.write(Practice.getPool()[j]);
    data.remove(symbol);
    return symbol;
  }

  String titleSymbol(){
    return title.toString();
  }

  final List<int> startGroup = <int>[];
  final StringBuffer title = new StringBuffer(null);
}