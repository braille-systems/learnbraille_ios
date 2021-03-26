import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/components/letter_widget.dart';
import 'package:braille_abc/symbol/image_symbol.dart';

import '../style.dart';

class LetterScreen extends SectionScreen {
  final SectionType sectionName;
  final String symbol;

  const LetterScreen({Key key, Screen helpPage, Screen previousPage, @required this.sectionName, @required this.symbol})
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
        ));
  }
}

class LetterView extends StatefulWidget {
  LetterView({Key key, @required this.sectionName, @required this.symbol}) : super(key: key);

  final String str = ScreenNames.getName(ScreenType.Letter);
  final SectionType sectionName;
  final String symbol;

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
                  primary: AppColors.changeModeBtn,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))),
                  padding: EdgeInsets.symmetric(vertical: ScreenParams.width(25, context)),

                ),
                onPressed: () => setState(() {
                  if (_dir == TextDirection.ltr) {
                    _dir = TextDirection.rtl;
                  } else if (_dir == TextDirection.rtl) _dir = TextDirection.ltr;
                }),
                child: Icon(
                  AppIcon.getIcon(AppIcons.ChangeModeButton),
                  color: AppColors.changeModeIcon,
                  semanticLabel: SemanticNames.getName(SemanticsType.ChangeMode),
                ),
              ),
              SymbolWidget(
                  textDir: mode,
                  char: widget.symbol,
                  isTapped: false,
                  width: 200,
                  height: 350,
                  dictSection: widget.sectionName),
              SizedBox(
                height: ScreenParams.width(60, context),
                width: ScreenParams.height(8, context),
              ),
              // change_mode_widget
            ],
          )
        ],
      ),
    );
  }
}