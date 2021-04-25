import 'package:braille_abc/shared/non_swipeable.dart';
import 'package:braille_abc/symbol/list_symbols.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/components/letter_widget.dart';
import 'package:braille_abc/components/practice_button_widget.dart';
import 'package:braille_abc/components/letter_buttons.dart';

@immutable
class LetterScreen extends SectionScreen {
  final SectionType sectionName;
  final ScreenType screenType;
  final String symbolName;
  final String shortSymbol;
  final bool isDotsTouchable;

  const LetterScreen(
      {Key key,
      Screen helpPage,
      Screen previousPage,
      @required this.screenType,
      @required this.sectionName,
      @required this.symbolName,
      @required this.isDotsTouchable,
      @required this.shortSymbol})
      : super(key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    Symbol symbol = Search.element(symbolName, sectionName);
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
          symbolName: symbolName,
          shortSymbol: shortSymbol,
          isDotsTouchable: isDotsTouchable,
          isText: false,
        ),
      ),
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
    @required this.symbolName,
    @required this.shortSymbol,
    @required this.isDotsTouchable,
    @required this.isText,
  }) : super(key: key);

  final String str = ScreenNames.getName(ScreenType.Letter);
  final SectionType sectionName;
  final ScreenType screenType;
  final Symbol symbol;
  final String symbolName;
  final String shortSymbol;
  final bool isDotsTouchable;
  final bool isText;

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

    //Symbol symbol = Search.element(widget.symbol, widget.sectionName);

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
        shortSymbol: widget.shortSymbol,
        isTouchable: widget.isDotsTouchable,
    );

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
                //TODO: add correct semantics
                label: SemanticNames.getName(SemanticsType.SectionInLetterWidget) +
                    SectionNames.getName(widget.sectionName) +
                    ". " +
                    SemanticNames.getName(SemanticsType.SymbolInLetterWidget) +
                    widget.shortSymbol,
                button: false,
                child: ExcludeSemantics(
                  child: LetterWidget(
                    title: widget.sectionName,
                    symbol: widget.shortSymbol,
                    titleText: widget.isText ? widget.symbolName : null,
                  ),
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
