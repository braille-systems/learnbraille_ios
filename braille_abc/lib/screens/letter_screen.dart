import 'package:braille_abc/components/change_mode_widget.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/components/letter_widget.dart';

class LetterScreen extends StatefulWidget {
  const LetterScreen(
      {Key key,
      @required this.str,
      @required this.titleSymbol,
      @required this.symbol})
      : super(key: key);

  final String str;
  final String titleSymbol;
  final String symbol;

  @override
  _LetterScreenState createState() => _LetterScreenState();
}

class _LetterScreenState extends State<LetterScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: NavigationBar(title: widget.str),
      child: Column(
        children: [
          SizedBox(
            height: ScreenParams.height(10, context),
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
            height: ScreenParams.height(15, context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: ScreenParams.height(10, context),
                width: ScreenParams.width(10, context),
              ),
              ChangeModeWidget(),
            ],
          )
        ],
      ),
    );
  }
}
