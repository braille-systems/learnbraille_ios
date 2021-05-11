import 'package:braille_abc/models/app_saves.dart';
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
  final String upperText;
  final String downText;
  final bool isDotsTouchable;
  final String title;

  const LetterScreenStudy(
      {Key key,
        Screen helpPage,
        Screen previousPage,
        @required this.title,
        @required this.screenType,
        @required this.sectionName,
        @required this.symbol,
        @required this.isDotsTouchable,
        @required this.upperText,
        @required this.downText})
      : super(key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    Saves.isLessonCompleted();
    return LetterColor(
      child: nonSwipeable(
        context,
        CupertinoPageScaffold(
          navigationBar: NavigationBar(
            currentPage: this,
            title:  ScreenNames.getName(ScreenType.Lesson) + " " + title,
          ),
          child: LetterView(
            screenType: screenType,
            sectionName: sectionName,
            symbol: symbol,
            symbolName: upperText,
            shortSymbol: downText,
            isDotsTouchable: isDotsTouchable,
            isText: true,
          ),
        ),
      ),
    );
  }
}
