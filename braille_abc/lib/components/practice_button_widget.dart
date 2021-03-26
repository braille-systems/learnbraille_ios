import 'package:auto_size_text/auto_size_text.dart';
import 'package:braille_abc/components/help_widgets.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/screens/letter_practice_screen.dart';
import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:braille_abc/models/practice_button.dart';

import 'package:braille_abc/style.dart';

import '../models/app_icons.dart';
import '../models/app_names.dart';
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
        style: ElevatedButton.styleFrom(
          primary: Colors.orange[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () {
          if (Practice.getPool().isNotEmpty) {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => LetterPracticeScreen(
                  helpPage: LetterPracticeHelp(),
                  previousPage: AppModel.navigationScreens[navigation.PracticeScreen],
                ),
              ),
            );
            PracticeSymbol.update();
            PracticeSymbol.addAllGroup();
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => LetterScreen(
                  symbol: PracticeSymbol.getString(),
                  sectionName: PracticeSymbol.getSectionName(),
                  screenType: ScreenType.Practice,
                  previousPage: AppModel.navigationScreens[navigation.PracticeScreen],
                  helpPage: LetterViewHelp(),
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
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300, color: CupertinoColors.black),
            ),
            SizedBox(
              width: ScreenParams.width(25, context),
            ),
            DecoratedIcon(
              AppIcon.getIcon(AppIcons.ContinueButton),
              color: CupertinoColors.black,
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
        style: ElevatedButton.styleFrom(
          primary: Colors.orange[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          textStyle: TextStyle(
            color: CupertinoColors.white,
            shadows: <Shadow>[
              Styles.buildButtonShadow(),
            ],
          ),
        ),
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
