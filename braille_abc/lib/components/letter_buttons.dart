import 'package:braille_abc/models/practice_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:braille_abc/style.dart';
import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/symbol/image_symbol.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';
import 'package:braille_abc/components/practice_button_widget.dart';
import 'package:braille_abc/components/lesson_buttons.dart';
import 'package:flutter/rendering.dart';

@immutable
class LetterButtons extends StatefulWidget {
  LetterButtons({
    @required this.sectionName,
    @required this.screenType,
    @required this.symbol,
    @required this.shortSymbol,
    @required this.isTouchable,
  });

  final SectionType sectionName;
  final ScreenType screenType;
  final Symbol symbol;
  final String shortSymbol;
  final bool isTouchable;

  @override
  _LetterButtonsState createState() => chooseState();

  _LetterButtonsState chooseState() {
    switch (screenType) {
      case ScreenType.Practice:
        return PracticeButtonsState();
      case ScreenType.Dictionary:
        return DictionaryButtonsState();
      case ScreenType.Study:
        return StudyButtonsState(isTouchable: isTouchable);
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
        buildModeButton(context, this),
        SymbolWidget(
            textDir: mode,
            symbol: widget.symbol,
            isTapped: false,
            width: ScreenParams.width(Sizes.getLetterWidgetSize().width, context),
            height: ScreenParams.height(Sizes.getLetterWidgetSize().height, context),
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
        buildModeButton(context, this),
        ValueListenableBuilder<bool>(
            valueListenable: isTapped,
            builder: (context, value, child) {
              return SymbolWidget(
                  textDir: mode,
                  symbol: widget.symbol,
                  isTapped: isTapped.value,
                  width: ScreenParams.width(Sizes.getLetterWidgetSize().width, context),
                  height: ScreenParams.height(Sizes.getLetterWidgetSize().height, context),
                  dictSection: widget.sectionName);
            }),
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          buildTipButton(context, isTapped),
          SizedBox(
            height: ScreenParams.height(2, context),
            width: ScreenParams.width(15, context),
          ),
          buildContinueButton(context, isTapped, pressed),
        ]),
      ],
    );
  }
}

class StudyButtonsState extends _LetterButtonsState {
  StudyButtonsState({@required this.isTouchable}) {
    isTapped.value = isTouchable;
  }

  final isTapped = ValueNotifier(true);
  final bool isTouchable;

  @override
  Widget build(BuildContext context) {
    TextDirection mode() {
      return _dir;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          buildSmallModeButton(context, this),
          buildBackForthButton(context, lessonButtonType.backward, super.widget.symbol),
        ]),
        ValueListenableBuilder<bool>(
            valueListenable: isTapped,
            builder: (context, value, child) {
              return SymbolWidget(
                  textDir: mode,
                  symbol: widget.symbol,
                  isTapped: isTapped.value,
                  width: ScreenParams.width(Sizes.getLetterWidgetSize().width, context),
                  height: ScreenParams.height(Sizes.getLetterWidgetSize().height, context),
                  dictSection: widget.sectionName);
            }),
        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          isTouchable ? buildTipButton(context, isTapped) : buildEmptyButton(context),
          buildBackForthButton(context, lessonButtonType.forward, super.widget.symbol),
        ]),
      ],
    );
  }
}



class ModeButton extends StatefulWidget {
  ModeButton({@required this.letter, @required this.style});

  final _LetterButtonsState letter;
  final ButtonStyle style;

  @override
  _ModeButtonState createState() => _ModeButtonState();
}

class _ModeButtonState extends State<ModeButton> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: SemanticNames.getName(SemanticsType.ChangeMode) +
          SemanticNames.getName(SemanticsType.ChosenMode) +
          ((widget.letter._dir == TextDirection.ltr)
              ? SemanticNames.getName(SemanticsType.Reading)
              : SemanticNames.getName(SemanticsType.Writing)),
      child: ExcludeSemantics(
        child: ElevatedButton(
          style: widget.style, //AppDecorations.changeDirButton,
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
          ),
        ),
      ),
    );
  }
}

class ContinueButton extends StatefulWidget {
  ContinueButton({@required this.isTapped, @required this.pressed});

  final ValueNotifier isTapped;
  final NewPracticeState pressed;

  @override
  _ContinueButtonState createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<ContinueButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppDecorations.nextButton,
      onPressed: () => setState(() {
        if (widget.isTapped.value) {
          widget.pressed.pressContinueButton(context);
        } else {
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
      onPressed: () {
        PracticeResults.incHintCounter();
        setState(() {
          widget.isTapped.value = !widget.isTapped.value;
        });
      },
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
  final Symbol symbol;
  final SectionType sectionName;

}

SizedBox buildSmallModeButton(BuildContext context, _LetterButtonsState letter) {
  return SizedBox(
    height: ScreenParams.height(Sizes.getModeTipButtonSize().height, context),
    width: ScreenParams.width(Sizes.getModeTipButtonSize().width, context),
    child: ModeButton(letter: letter, style: AppDecorations.changeDirButton),
  );
}

SizedBox buildModeButton(BuildContext context, _LetterButtonsState letter) {
  return SizedBox(
    height: ScreenParams.height(Sizes.getModeButton().height, context),
    width: ScreenParams.width(Sizes.getModeButton().width, context),
    child: ModeButton(letter: letter, style: AppDecorations.changeDirButton),
  );
}

SizedBox buildTipButton(BuildContext context, ValueNotifier isTapped) {
  return SizedBox(
    height: ScreenParams.height(Sizes.getModeTipButtonSize().height, context),
    width: ScreenParams.width(Sizes.getModeTipButtonSize().width, context),
    child: TipButton(isTapped: isTapped),
  );
}

SizedBox buildEmptyButton(BuildContext context) {
  return SizedBox(
    height: ScreenParams.height(Sizes.getModeTipButtonSize().height, context),
    width: ScreenParams.width(Sizes.getModeTipButtonSize().width, context),
  );
}

SizedBox buildContinueButton(BuildContext context, ValueNotifier isTapped, NewPracticeState pressed) {
  return SizedBox(
    height: ScreenParams.height(Sizes.getBackFortButtonSize().height, context),
    width: ScreenParams.width(Sizes.getBackFortButtonSize().width, context),
    child: ContinueButton(isTapped: isTapped, pressed: pressed),
  );

}
