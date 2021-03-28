import 'dart:async';

import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/components/help_widgets.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:braille_abc/screens/letter_screen.dart';
import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';
import 'package:braille_abc/style.dart';

@immutable
class StudyItem extends StatelessWidget {
  const StudyItem({
    Key key,
    @required this.symbol,
    @required this.sectionName,
  }) : super(key: key);

  final SectionType sectionName;
  final Symbol symbol;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: CupertinoColors.inactiveGray, width: 0.5)), shape: BoxShape.rectangle
          // shape: BoxShape.circle,
          ),
      child: CupertinoButton(
        color: CupertinoColors.white,
        disabledColor: CupertinoColors.white,
        onPressed: () {
          Timer(Duration(milliseconds: 10), () {
            scakey.currentState.displayTapBar(false);
          });
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => LetterScreen(
                sectionName: sectionName,
                screenType: ScreenType.Letter,
                symbol: symbol.getChar(),
                previousPage: AppModel.navigationScreens[navigation.DictionaryScreen],
                helpPage:  LetterViewHelp(),
                isDotsTouchable: false,
              ),
            ),
          );
        },
        child: Text(symbol.dotsToString(), style: TextStyle(color: CupertinoColors.black)),
      ),
    );
  }
}
