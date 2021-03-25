import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/screens/practice_screen.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/symbol/list_symbols.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/components/letter_widget.dart';
import 'package:braille_abc/symbol/image_symbol.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';
import 'dart:math';
import 'package:braille_abc/components/help_widgets.dart';
import 'package:braille_abc/models/app_model.dart';

import '../style.dart';

class LetterScreen extends SectionScreen {
  final SectionType sectionName;
  final String symbol;
  final bool touchable;

  const LetterScreen(
      {Key key,
      Screen helpPage,
      Screen previousPage,
      @required this.sectionName,
      @required this.symbol,
      @required this.touchable})
      : super(key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: NavigationBar(
          currentPage: this,
          title: ScreenNames.getName(ScreenType.Letter),
        ),
        child: LetterView(
          sectionName: sectionName,
          symbol: symbol,
          touchable: touchable,
        ));
  }
}

class LetterView extends StatefulWidget {
  LetterView({Key key, @required this.sectionName, @required this.symbol, @required this.touchable}) : super(key: key);

  final String str = ScreenNames.getName(ScreenType.Letter);
  final SectionType sectionName;
  final String symbol;
  final bool touchable;

  @override
  _LetterViewState createState() => _LetterViewState();
}

class _LetterViewState extends State<LetterView> {
  TextDirection _dir = TextDirection.ltr;

  @override
  void initState() {
    super.initState();
  }

  TextDirection mode() {
    return _dir;
  }

  @override
  Widget build(BuildContext context) {
    TextDirection mode() {
      return _dir;
    }

    return CupertinoPageScaffold(
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: CupertinoColors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  textStyle: TextStyle(
                    color: CupertinoColors.white,
                    shadows: <Shadow>[
                      Styles.buildButtonShadow(),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(vertical: ScreenParams.width(25, context)),
                ),
                onPressed: () => setState(() {
                  if (this._dir == TextDirection.ltr)
                    this._dir = TextDirection.rtl;
                  else if (this._dir == TextDirection.rtl) this._dir = TextDirection.ltr;
                }),
                child: Icon(
                  AppIcon.getIcon(AppIcons.ChangeModeButton),
                  color: CupertinoColors.white,
                  semanticLabel: SemanticNames.getName(SemanticsType.ChangeMode),
                ),
              ),
              SymbolWidget(
                  textDir: mode,
                  char: widget.symbol,
                  isTapped: widget.touchable,
                  width: 200,
                  height: 350,
                  dictSection: widget.sectionName),
              widget.touchable
                  ? SizedBox(
                      height: ScreenParams.height(30, context),
                      width: ScreenParams.width(17, context),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: CupertinoColors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          textStyle: TextStyle(
                            color: CupertinoColors.white,
                            shadows: <Shadow>[
                              Styles.buildButtonShadow(),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(vertical: ScreenParams.width(25, context)),
                        ),
                        onPressed: () => setState(() {
                          if (PracticeSymbol.endPractice()) Practice.updatePool();
                          !PracticeSymbol.endPractice()
                              ? Navigator.of(context).push(
                                  CupertinoPageRoute(
                                    builder: (context) => LetterScreen(
                                      symbol: PracticeSymbol.getString(),
                                      sectionName: PracticeSymbol.getSectionName(),
                                      previousPage: AppModel.navigationScreens[navigation.DictionaryScreen],
                                      helpPage: LetterViewHelp(),
                                      touchable: true,
                                    ),
                                  ),
                                )
                              : Navigator.of(context).push(
                                  CupertinoPageRoute(
                                      builder: (context) => PracticeScreen(
                                            previousPage: AppModel.navigationScreens[navigation.MainMenu],
                                            helpPage: PracticeHelp(),
                                          )),
                                );
                        }),
                        child: Icon(
                          CupertinoIcons.chevron_right_2,
                          color: CupertinoColors.white,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: ScreenParams.height(30, context),
                      width: ScreenParams.width(17, context),
                    ),
            ],
          )
        ],
      ),
    );
  }
}

class PracticeSymbol {
  static void addAllGroup() {
    List<SectionType> strings = Practice.getPool();
    SymbolsFactory factory = new SymbolsFactory();
    for (var i in strings) {
      var group = factory.createSymbolsGroup(i);
      _data.addAll(group);
      _startGroup.add(_data.length);
    }
  }

  static String getString() {
    var rand = new Random();
    int num = rand.nextInt(_data.length);
    Symbol symbol = _data[num];
    int j = -1, q = 0;
    for (var i in _startGroup) {
      if (i > num) {
        if (j == -1) j = q;
        _startGroup[q]--;
      }
      q++;
    }
    _title = Practice.getPool()[j];
    _data.remove(symbol);
    return symbol.char;
  }

  static SectionType getSectionName() {
    return _title;
  }

  static void update() {
    _startGroup.clear();
    _data.clear();
  }

  static bool endPractice() {
    if (_data.length == 0)
      return true;
    else
      return false;
  }

  static final List<int> _startGroup = <int>[];
  static final List<Symbol> _data = <Symbol>[];
  static SectionType _title;
}
