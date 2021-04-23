import 'package:braille_abc/shared/non_swipeable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';
import 'package:braille_abc/screens/letter_screen.dart';

@immutable
class LetterScreenStudy extends SectionScreen {
  final SectionType sectionName;
  final ScreenType screenType;
  final Symbol symbol;
  final String text;
  final bool isDotsTouchable;

  const LetterScreenStudy(
      {Key key,
        Screen helpPage,
        Screen previousPage,
        @required this.screenType,
        @required this.sectionName,
        @required this.symbol,
        @required this.isDotsTouchable,
        @required this.text})
      : super(key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    return nonSwipeable(
      context,
      CupertinoPageScaffold(
        navigationBar: NavigationBar(
          currentPage: this,
          title: ScreenNames.getName(screenType),
        ),
        child: LetterView(
          screenType: screenType,
          sectionName: sectionName,
          symbol: symbol,
          shortSymbol: text,
          isDotsTouchable: isDotsTouchable,
        ),
      ),
    );
  }
}
