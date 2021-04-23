import 'package:auto_size_text/auto_size_text.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:vibration/vibration.dart';
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
import 'package:braille_abc/screens/results_screen.dart';
import 'package:braille_abc/components/letter_buttons.dart';
import 'package:braille_abc/style.dart';
import 'package:braille_abc/screens/letter_screen.dart';

@immutable
class ContinueButtonWidget extends StatefulWidget {
  ContinueButtonWidget();

  @override
  State<ContinueButtonWidget> createState() => _ContinueButtonWidget();
}

class _ContinueButtonWidget extends State<ContinueButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: SemanticNames.getName(SemanticsType.Continue) +
          ". " +
          SemanticNames.getName(SemanticsType.Button) +
          (Practice.isNotEmpty.value
              ? SemanticNames.getName(SemanticsType.Available)
              : SemanticNames.getName(SemanticsType.NotAvailable)),
      child: ExcludeSemantics(
        child: ElevatedButton(
          style: AppDecorations.navigationButton,
          onPressed: Practice.isNotEmpty.value
              ? () {
                  scakey.currentState.displayTapBar(false);
                  PracticeSymbol.update();
                  PracticeSymbol.addAllGroup();
                  PracticeSymbol.nextSymbol();
                  PracticeResults.updatePracticeResults();
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => LetterScreen(
                        symbolName: PracticeSymbol.getSymbol(),
                        shortSymbol: PracticeSymbol.getShortSymbol(),
                        sectionName: PracticeSymbol.getSectionType(),
                        screenType: ScreenType.Practice,
                        previousPage: AppModel.navigationScreens[navigation.PracticeScreen],
                        helpPage: Help(helpName: HelpSections.LetterPractice),
                        isDotsTouchable: true,
                      ),
                    ),
                  );
                }
              : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ExcludeSemantics(
                child: AutoSizeText(
                  SemanticNames.getName(SemanticsType.Continue),
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300, color: AppColors.continueBtnTextIcon),
                ),
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
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Semantics(
        label: SectionNames.getName(widget.practiceButton.sectionType) +
            ((checkBox)
                ? SemanticNames.getName(SemanticsType.Selected)
                : SemanticNames.getName(SemanticsType.NotSelected)),
        child: ExcludeSemantics(
          child: ListTile(
            minVerticalPadding: 0,
            onTap: () => onChanged(!checkBox),
            leading: Icon(
              AppIcon.getIcon(widget.practiceButton.icon),
              color: AppColors.first,
              size: Sizes.lineSectionIconSize,
            ),
            title: Align(
              alignment: Alignment.centerLeft,
              child: ExcludeSemantics(
                child: AutoSizeText(
                  SectionNames.getName(widget.practiceButton.sectionType),
                  style: TextStyle(
                      fontSize: Sizes.lineSectionFontSize, color: AppColors.symbolText, fontWeight: FontWeight.w400),
                  maxLines: 2,
                ),
              ),
            ),
            trailing: CupertinoSwitch(
              activeColor: AppColors.first,
              value: checkBox,
              onChanged: (bool val) {
                onChanged(val);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class Pair {
  Pair(this.symbol, this.shortSymbol, this.title);

  void setPair(Pair pair) {
    symbol = pair.symbol;
    shortSymbol = pair.shortSymbol;
    title = pair.title;
  }

  String symbol;
  String shortSymbol;
  SectionType title;
}

class PracticeSymbol {
  static void addAllGroup() {
    var pool = Practice.getPool();
    var factory = SymbolsFactory();
    for (var item in pool) {
      var group = factory.createSymbolsGroup(item);
      for (var symbol in group) {
        _symbolsPool.add(Pair(symbol.getChar(), symbol.getShortChar(), item));
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

  static String getShortSymbol() => _curSymbol.shortSymbol ?? _curSymbol.symbol;

  static SectionType getSectionType() => _curSymbol.title;
  static final Pair _curSymbol = Pair(null, null, null);
  static final List<Pair> _symbolsPool = [];
}

class NewPracticeState extends OnPressButton {
  NewPracticeState(ScreenType screenType, Symbol symbol, SectionType sectionName)
      : super(screenType: screenType, sectionName: sectionName, symbol: symbol);

  @override
  void pressContinueButton(BuildContext context) {
    if (PracticeResults.checkAnswer(super.symbol.getDotsInfo())) {
      PracticeResults.incCorrectAnswerCounter();
      // Vibration.vibrate(duration: 300, amplitude: 128, repeat: 3);
    } else {
      PracticeResults.incStepCounter();
      // Vibration.vibrate(duration: 600, amplitude: 256);
    }
    PracticeResults.resetAnswer();

    if (!PracticeSymbol.isPracticeEnd()) {
      PracticeSymbol.nextSymbol();
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => LetterScreen(
            screenType: super.screenType,
            symbolName: PracticeSymbol.getSymbol(),
            shortSymbol: PracticeSymbol.getShortSymbol(),
            sectionName: PracticeSymbol.getSectionType(),
            previousPage: AppModel.navigationScreens[navigation.PracticeScreen],
            helpPage: Help(helpName: HelpSections.LetterPractice),
            isDotsTouchable: true,
          ),
        ),
      );
    } else {
      var results = PracticeResults.getResults();
      Practice.updatePool();
      PracticeSymbol.update();
      Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => ResultsScreen(
            helpPage: Help(
              helpName: HelpSections.PracticeResult,
            ),
            previousPage: AppModel.navigationScreens[navigation.PracticeScreen],
            results: results,
          ),
        ),
      );
      PracticeResults.updatePracticeResults();
    }
  }

  @override
  void pressHelpButton(BuildContext context) {}
}
