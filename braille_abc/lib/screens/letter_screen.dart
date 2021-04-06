//import 'dart:html';

import 'package:braille_abc/shared/non_swipeable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:braille_abc/style.dart';
import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/components/letter_widget.dart';
import 'package:braille_abc/symbol/image_symbol.dart';
import 'package:braille_abc/components/practice_button_widget.dart';

@immutable
class LetterScreen extends SectionScreen {
  final SectionType sectionName;
  final ScreenType screenType;
  final String symbol;
  final bool isDotsTouchable;

  const LetterScreen(
      {Key key,
      Screen helpPage,
      Screen previousPage,
      @required this.screenType,
      @required this.sectionName,
      @required this.symbol,
      @required this.isDotsTouchable})
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
            isDotsTouchable: isDotsTouchable,
          )),
    );
  }
}

@immutable
class LetterView extends StatefulWidget {
  LetterView(
      {Key key,
      @required this.sectionName,
      @required this.screenType,
      @required this.symbol,
      @required this.isDotsTouchable})
      : super(key: key);

  final String str = ScreenNames.getName(ScreenType.Letter);
  final SectionType sectionName;
  final ScreenType screenType;
  final String symbol;
  final bool isDotsTouchable;

  @override
  _LetterViewState createState() => _LetterViewState();
}

class _LetterViewState extends State<LetterView> {
  TextDirection _dir = TextDirection.ltr;
  OnPressButton pressed;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextDirection mode() {
      return _dir;
    }
    switch (widget.screenType) {//add buttons realization
      case ScreenType.Practice:
        pressed = NewPracticeState(widget.screenType, widget.symbol, widget.sectionName);
        break;
      case ScreenType.Study:
        break;
      default:
        break;
    }

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
                SizedBox(
                  height: ScreenParams.height(30, context),
                  width: ScreenParams.width(17, context),
                  child: ModeButton(letter: this),
                ),
                SymbolWidget(
                    textDir: mode,
                    char: widget.symbol,
                    isTapped: widget.isDotsTouchable,
                    width: 200,
                    height: 350,
                    dictSection: widget.sectionName),
                widget.isDotsTouchable
                    ? SizedBox(
                        height: ScreenParams.height(30, context),
                        width: ScreenParams.width(17, context),
                        child: ContinueButton(letter: this),
                      )
                    : SizedBox(
                        height: ScreenParams.height(30, context),
                        width: ScreenParams.width(17, context),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ModeButton extends StatefulWidget{

  ModeButton({@required this.letter});

  final _LetterViewState letter;

  @override
  _ModeButtonState createState() => _ModeButtonState();
}

class _ModeButtonState extends State<ModeButton>{
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      style: AppDecorations.changeDirButton,
      onPressed: () => setState((){
          widget.letter.setState(() {
            if(widget.letter._dir == TextDirection.ltr){
              widget.letter._dir = TextDirection.rtl;
            }
            else{
              widget.letter._dir = TextDirection.ltr;
            }
          });
        },
      ),
      child: Icon(
        AppIcon.getIcon(AppIcons.ChangeModeButton),
        color: AppColors.sideIcon,
        semanticLabel: SemanticNames.getName(SemanticsType.ChangeMode),
      ),
    );
  }
}

class ContinueButton extends StatefulWidget{

  ContinueButton({@required this.letter});

  final _LetterViewState letter;

  @override
  _ContinueButtonState createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<ContinueButton>{
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppDecorations.nextButton,
      onPressed: () => setState(() {
        widget.letter.pressed.pressContinueButton(context);
        widget.letter.setState(() {
        });
      }),
      child: Icon(
        AppIcon.AppIconsMap[AppIcons.ContinueButton],
        color: AppColors.sideIcon,
        semanticLabel: SemanticNames.getName(SemanticsType.Continue),
      ),
    );
  }
}

abstract class OnPressButton{//realization buttons
  OnPressButton({
    @required this.screenType,
    @required this.symbol,
    @required this.sectionName
  });

  final ScreenType screenType;
  final String symbol;
  final SectionType sectionName;

  void pressContinueButton(BuildContext context);
  void pressHelpButton(BuildContext context);
}