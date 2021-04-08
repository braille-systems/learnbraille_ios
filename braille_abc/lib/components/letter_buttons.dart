import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:braille_abc/style.dart';
import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/symbol/image_symbol.dart';
import 'package:braille_abc/components/practice_button_widget.dart';
import 'package:flutter/rendering.dart';

@immutable
class LetterButtons extends StatefulWidget{
  LetterButtons({
    @required this.sectionName,
    @required this.screenType,
    @required this.symbol,
    @required this.shortSymbol,
  });

  final SectionType sectionName;
  final ScreenType screenType;
  final String symbol;
  final String shortSymbol;

  @override
  _LetterButtonsState createState() => chooseState();

  _LetterButtonsState chooseState(){
    switch(screenType){
      case ScreenType.Practice:
        return PracticeButtonsState();
      case ScreenType.Dictionary:
        return DictionaryButtonsState();
      default:
        return DictionaryButtonsState();
    }
  }
}

abstract class _LetterButtonsState extends State<LetterButtons>{
  TextDirection _dir = TextDirection.ltr;
  OnPressButton pressed;

  @override
  Widget build(BuildContext context);
}

class DictionaryButtonsState extends _LetterButtonsState{
  @override
  Widget build(BuildContext context){
    TextDirection mode() {
      return _dir;
    }
    pressed = null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          height: ScreenParams.height(37, context),
          width: ScreenParams.width(17, context),
          child: ModeButton(letter: this),
        ),
        SymbolWidget(
            textDir: mode,
            char: widget.symbol,
            isTapped: false,
            width: 200,
            height: 350,
            dictSection: widget.sectionName),
        SizedBox(
          height: ScreenParams.height(37, context),
          width: ScreenParams.width(17, context),
        )
      ],
    );
  }
}

class PracticeButtonsState extends _LetterButtonsState{
  @override
  Widget build(BuildContext context){
    TextDirection mode() {
      return _dir;
    }
    pressed = NewPracticeState(widget.screenType, widget.symbol, widget.sectionName);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              SizedBox(
                height: ScreenParams.height(12, context),
                width: ScreenParams.width(17, context),
                child: TipButton(letter: this),
              ),
              SizedBox(
                height: ScreenParams.height(4, context),
                width: ScreenParams.width(17, context),
              ),
              SizedBox(
                height: ScreenParams.height(21, context),
                width: ScreenParams.width(17, context),
                child: ModeButton(letter: this),
              ),
            ]
        ),
        SymbolWidget(
            textDir: mode,
            char: widget.symbol,
            isTapped: true,
            width: 200,
            height: 350,
            dictSection: widget.sectionName),
        SizedBox(
          height: ScreenParams.height(37, context),
          width: ScreenParams.width(17, context),
          child: ContinueButton(letter: this),
        )
      ],
    );
  }
}

class ModeButton extends StatefulWidget {
  ModeButton({@required this.letter});

  final _LetterButtonsState letter;

  @override
  _ModeButtonState createState() => _ModeButtonState();
}

class _ModeButtonState extends State<ModeButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppDecorations.changeDirButton,
      onPressed: () => setState(
            () {
          widget.letter.setState(() {
            if (widget.letter._dir == TextDirection.ltr) {
              widget.letter._dir = TextDirection.rtl;
            } else {
              widget.letter._dir = TextDirection.ltr;
            }
          });
          SemanticsService.announce("Режим изменен", TextDirection.ltr);
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

class ContinueButton extends StatefulWidget {
  ContinueButton({@required this.letter});

  final _LetterButtonsState letter;

  @override
  _ContinueButtonState createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<ContinueButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppDecorations.nextButton,
      onPressed: () => setState(() {
        widget.letter.pressed.pressContinueButton(context);
        widget.letter.setState(() {});
      }),
      child: Icon(
        AppIcon.AppIconsMap[AppIcons.ContinueButton],
        color: AppColors.sideIcon,
        semanticLabel: SemanticNames.getName(SemanticsType.Continue),
      ),
    );
  }
}

class TipButton extends StatefulWidget {
  TipButton({@required this.letter});

  final _LetterButtonsState letter;

  @override
  _TipButtonState createState() => _TipButtonState();
}

class _TipButtonState extends State<TipButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppDecorations.hintButton,
      onPressed: () => setState(
            () {
          widget.letter.setState(() {
          });
        },
      ),
      child: Icon(
        AppIcon.getIcon(AppIcons.TipButton),
        color: AppColors.sideIcon,
        semanticLabel: SemanticNames.getName(SemanticsType.ChangeMode),
      ),
    );
  }
}

abstract class OnPressButton {
  //realization buttons
  OnPressButton({@required this.screenType, @required this.symbol, @required this.sectionName});

  final ScreenType screenType;
  final String symbol;
  final SectionType sectionName;

  void pressContinueButton(BuildContext context);

  void pressHelpButton(BuildContext context);
}
