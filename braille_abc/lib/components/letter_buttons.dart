import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:braille_abc/style.dart';
import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/symbol/image_symbol.dart';
import 'package:braille_abc/components/practice_button_widget.dart';
import 'package:flutter/rendering.dart';

@immutable
class LetterButtons extends StatefulWidget {
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

  _LetterButtonsState chooseState() {
    switch (screenType) {
      case ScreenType.Practice:
        return PracticeButtonsState();
      case ScreenType.Dictionary:
        return DictionaryButtonsState();
      default:
        return DictionaryButtonsState();
    }
  }
}

abstract class _LetterButtonsState extends State<LetterButtons> {
  TextDirection _dir = TextDirection.ltr;
  OnPressButton pressed;

  @override
  Widget build(BuildContext context);
}

class DictionaryButtonsState extends _LetterButtonsState {
  @override
  Widget build(BuildContext context) {
    TextDirection mode() {
      return _dir;
    }

    pressed = null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          height: ScreenParams.height(34, context),
          width: ScreenParams.width(15, context),
          child: ModeButton(letter: this),
        ),
        SymbolWidget(
            textDir: mode,
            char: widget.symbol,
            isTapped: false,
            width: ScreenParams.width(57, context),
            height: ScreenParams.height(45, context),
            dictSection: widget.sectionName),
        SizedBox(
          height: ScreenParams.height(37, context),
          width: ScreenParams.width(14, context),
        )
      ],
    );
  }
}

class PracticeButtonsState extends _LetterButtonsState {
  PracticeButtonsState();

  final isTapped = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    TextDirection mode() {
      return _dir;
    }

    pressed = NewPracticeState(widget.screenType, widget.symbol, widget.sectionName);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          height: ScreenParams.height(34, context),
          width: ScreenParams.width(15, context),
          child: ModeButton(letter: this),
        ),
        ValueListenableBuilder<bool>(
            valueListenable: isTapped,
            builder: (context, value, child){
              return SymbolWidget(
                  textDir: mode,
                  char: widget.symbol,
                  isTapped: isTapped.value,
                  width: ScreenParams.width(57, context),
                  height: ScreenParams.height(45, context),
                  dictSection: widget.sectionName);
            }),
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
            height: ScreenParams.height(12, context),
            width: ScreenParams.width(15, context),
            child: TipButton(isTapped: isTapped),
          ),
          SizedBox(
            height: ScreenParams.height(2, context),
            width: ScreenParams.width(15, context),
          ),
          SizedBox(
            height: ScreenParams.height(29, context),
            width: ScreenParams.width(15, context),
            child: ContinueButton(isTapped: isTapped, pressed: pressed),
          ),
        ]),
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
    return Semantics(
      label: SemanticNames.getName(SemanticsType.ChangeMode),
      hint: SemanticNames.getName(SemanticsType.ChosenMode) +
          ((widget.letter._dir == TextDirection.ltr)
              ? SemanticNames.getName(SemanticsType.Reading)
              : SemanticNames.getName(SemanticsType.Writing)),
      child: ElevatedButton(
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
                },
              ),
          child: ExcludeSemantics(
            child: Icon(
              AppIcon.getIcon(AppIcons.ChangeModeButton),
              size: ScreenParams.width(10, context),
              color: AppColors.sideIcon,
            ),
          )),
    );
  }
}

class ContinueButton extends StatefulWidget {
  ContinueButton({@required this.isTapped, @required this.pressed});

  final ValueNotifier isTapped;
  final OnPressButton pressed;

  @override
  _ContinueButtonState createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<ContinueButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppDecorations.nextButton,
      onPressed: () => setState(() {
        if(widget.isTapped.value) {
          widget.pressed.pressContinueButton(context);
        }
        else{
          widget.isTapped.value = true;
        }
      }),
      child: Icon(
        AppIcon.AppIconsMap[AppIcons.ContinueButton],
        size: ScreenParams.width(10, context),
        color: AppColors.sideIcon,
        semanticLabel: SemanticNames.getName(SemanticsType.Continue),
      ),
    );
  }
}

class TipButton extends StatefulWidget {
  TipButton({@required this.isTapped});

  final ValueNotifier isTapped;

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
          widget.isTapped.value = !widget.isTapped.value;
        },
      ),
      child: Icon(
        AppIcon.getIcon(AppIcons.TipButton),
        size: ScreenParams.width(10, context),
        color: AppColors.sideIcon,
        semanticLabel: SemanticNames.getName(SemanticsType.Hint),
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
