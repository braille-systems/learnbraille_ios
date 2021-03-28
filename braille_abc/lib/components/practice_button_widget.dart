import 'package:auto_size_text/auto_size_text.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:braille_abc/components/help_widgets.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:braille_abc/models/practice_button.dart';
import 'package:braille_abc/symbol/list_symbols.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';
import 'package:braille_abc/components/bottom_bar_widget.dart';

import 'package:braille_abc/style.dart';
import 'package:braille_abc/screens/letter_screen.dart';


@immutable
class ContinueButtonWidget extends StatefulWidget {
  @override
  State<ContinueButtonWidget> createState() => _ContinueButtonWidget();
}

class _ContinueButtonWidget extends State<ContinueButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: SemanticNames.getName(SemanticsType.Continue),
      child: ElevatedButton(
        style: AppDecorations.sectionButton,
        onPressed: () {
          if (Practice.getPool().isNotEmpty) {
            scakey.currentState.displayTapBar(false);
            PracticeSymbol.update();
            PracticeSymbol.addAllGroup();
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => LetterScreen(
                  symbol: PracticeSymbol.getString(),
                  sectionName: PracticeSymbol.getSectionName(),
                  screenType: ScreenType.Practice,
                  previousPage: AppModel.navigationScreens[navigation.PracticeScreen],
                  helpPage: LetterPracticeHelp(),
                  isDotsTouchable: true,
                ),
              ),
            );
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AutoSizeText(
              SemanticNames.getName(SemanticsType.Continue),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w300, color: AppColors.continueBtnTextIcon),
            ),
            SizedBox(
              width: ScreenParams.width(25, context),
            ),
            DecoratedIcon(
              AppIcon.getIcon(AppIcons.ContinueButton),
              color: AppColors.continueBtnTextIcon,
              size: 22.0,
            ),
          ],
        ),
      ),
    );
  }
}

class PracticeButtonWidget extends StatefulWidget {
  const PracticeButtonWidget({
    Key key,
    @required this.practiceButton,
  }) : super(key: key);

  final PracticeButton practiceButton;

  @override
  State<PracticeButtonWidget> createState() => _PracticeButtonWidget();
}

class _PracticeButtonWidget extends State<PracticeButtonWidget> {
  bool checkBox = false;

  void onChanged(bool val) {
    setState(
      () {
        checkBox = val;
        if (checkBox) {
          Practice.addSymbolGroup(widget.practiceButton.sectionType);
        } else {
          Practice.removeSymbolGroup(widget.practiceButton.sectionType);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: SectionNames.getName(widget.practiceButton.sectionType),
      child: ElevatedButton(
        style: AppDecorations.sectionButton,
        onPressed: () {
          onChanged(!checkBox);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              child: AutoSizeText(
                SectionNames.getName(widget.practiceButton.sectionType),
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: ScreenParams.height(2.0, context),
            ),
            DecoratedIcon(
              AppIcon.getIcon(widget.practiceButton.icon),
              color: CupertinoColors.white,
              size: 45.0,
              shadows: <Shadow>[
                Styles.buildButtonShadow(),
                for (var stroke in Styles.buildStroke(0.25)) stroke,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: ScreenParams.width(10, context),
                  height: ScreenParams.height(5, context),
                  child: Checkbox(
                    value: checkBox,
                    onChanged: (bool val) {
                      onChanged(val);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PracticeSymbol {
  static void addAllGroup() {
    final List<SectionType> strings = Practice.getPool();
    final SymbolsFactory factory = SymbolsFactory();
    for (var i in strings) {
      var group = factory.createSymbolsGroup(i);
      for(var j in group) {
        _data[j] = i;
      }
    }
  }

  static String getString() {
    var rand = Random();
    if(_data.isEmpty){
      return "";
    }
    final int num = rand.nextInt(_data.length);
    final Symbol symbol = _data.keys.toList()[num];
    _title = _data[symbol];
    _data.remove(symbol);
    return symbol.char;
  }

  static SectionType getSectionName() {
    return _title;
  }

  static void update(){
    _data.clear();
  }

  static bool endPractice() {
    if (_data.isEmpty) {
      return true;
    }
    else {
      return false;
    }
  }

  static final Map<Symbol, SectionType> _data = Map<Symbol, SectionType>();
  static SectionType _title;
}