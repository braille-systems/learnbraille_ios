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
import 'package:braille_abc/components/bottom_bar_widget.dart';

import 'package:braille_abc/style.dart';
import 'package:braille_abc/screens/letter_screen.dart';


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
            PracticeSymbol.nextSymbol();
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => LetterScreen(
                  symbol: PracticeSymbol.getSymbol(),
                  sectionName: PracticeSymbol.getSectionType(),
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
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300, color: AppColors.continueBtnTextIcon),
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
                style: TextStyle(fontSize: 20),
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

class Pair {
  Pair(this.symbol, this.title);

  void setPair(Pair pair) {
    symbol = pair.symbol;
    title = pair.title;
  }

  String symbol;
  SectionType title;
}

class PracticeSymbol {
  static void addAllGroup() {
    var pool = Practice.getPool();
    var factory = SymbolsFactory();
    for(var item in pool) {
      var group = factory.createSymbolsGroup(item);
      for(var symbol in group) {
        _symbolsPool.add(Pair(symbol.char, item));
      }
    }
  }

  static void nextSymbol() {
    var rand = Random();
    var num = rand.nextInt(_symbolsPool.length);
    _curSymbol.setPair(_symbolsPool[num]);
    _symbolsPool.removeAt(num);
  }

  static void update() {
    _symbolsPool.clear();
  }

  static bool isPracticeEnd() => _symbolsPool.isEmpty;

  static String getSymbol() => _curSymbol.symbol;

  static SectionType getSectionType() => _curSymbol.title;

  static final Pair _curSymbol = Pair(null, null);
  static final List<Pair> _symbolsPool = [];
}
