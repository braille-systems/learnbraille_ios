import 'package:braille_abc/shared/non_swipeable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/components/letter_widget.dart';
import 'package:braille_abc/components/practice_button_widget.dart';
import 'package:braille_abc/components/letter_buttons.dart';

@immutable
class LetterScreen extends SectionScreen {
  final SectionType sectionName;
  final ScreenType screenType;
  final String symbol;
  final String shortSymbol;
  final bool isDotsTouchable;

  const LetterScreen(
      {Key key,
      Screen helpPage,
      Screen previousPage,
      @required this.screenType,
      @required this.sectionName,
      @required this.symbol,
      @required this.isDotsTouchable,
      @required this.shortSymbol})
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
            shortSymbol: shortSymbol,
            isDotsTouchable: isDotsTouchable,
          )),
    );
  }
}

@immutable
class LetterView extends StatefulWidget {
  LetterView({
    Key key,
    @required this.sectionName,
    @required this.screenType,
    @required this.symbol,
    @required this.shortSymbol,
    @required this.isDotsTouchable,
  }) : super(key: key);

  final String str = ScreenNames.getName(ScreenType.Letter);
  final SectionType sectionName;
  final ScreenType screenType;
  final String symbol;
  final String shortSymbol;
  final bool isDotsTouchable;

  @override
  _LetterViewState createState() => _LetterViewState();
}

class _LetterViewState extends State<LetterView> {
  OnPressButton pressed;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.screenType) {
      //add buttons realization
      case ScreenType.Practice:
        pressed = NewPracticeState(widget.screenType, widget.symbol, widget.sectionName);
        break;
      case ScreenType.Study:
        break;
      default:
        break;
    }

    LetterButtons letterButtons = LetterButtons(
        sectionName: widget.sectionName,
        screenType: widget.screenType,
        symbol: widget.symbol,
        shortSymbol: widget.shortSymbol);

    return nonSwipeable(
      context,
      CupertinoPageScaffold(
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
                  title: widget.sectionName,
                  symbol: widget.shortSymbol,
                ),
              )
            ]),
            SizedBox(
              height: ScreenParams.height(3, context),
            ),
            letterButtons,
          ],
        ),
      ),
    );
  }
}
