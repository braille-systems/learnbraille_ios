import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/components/help_widgets.dart';

import 'package:braille_abc/style.dart';

import '../models/menu_button.dart';
import 'package:braille_abc/screens/letter_screen.dart';

class ContinueButtonWidget extends StatefulWidget {
  @override
  State<ContinueButtonWidget> createState() => _ContinueButtonWidget();
}

class _ContinueButtonWidget extends State<ContinueButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "Продолжить",
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AutoSizeText(
              "Продолжить",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300, color: CupertinoColors.black),
            ),
            SizedBox(
              width: ScreenParams.width(25, context),
            ),
            DecoratedIcon(
              CupertinoIcons.chevron_right_2,
              color: CupertinoColors.black,
              size: 22.0,
            ),
          ],
        ),
        onPressed: () {
          if (Practice.getPool().isNotEmpty) {
            print(Practice.getPool());
          }
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => LetterScreen(
                titleSymbol: 't',
                symbol: 't',
                previousPage: AppModel.navigationScreens[navigation.DictionaryScreen],
                helpPage:  LetterViewHelp(),
                touchable: true,
              ),
            ),
          );
          },
      ),
    );
  }
}

/*class PracticeSymbol extends StatefulWidget{
  PracticeSymbol(Key key,
  List<String> str): super(key: key){
    SymbolsFactory factory = new SymbolsFactory();
    for(var i in Practice.getPool()) {
      var group = factory.createSymbolsGroup(i);
      data.addAll(group);
      title[group.length] = i;
    }
  }

  final List<Symbol> data = <Symbol>[];
  final Map<int, String> title = new Map<int, String>();

  void rand(Symbol sym, String tit){
    var rand = new Random();
    int num = rand.nextInt(data.length);
    sym = data[num];
    int startTitle = 0;
    for(var i in title.keys) {
      if (num < i) {
        if ((startTitle != 0) && (startTitle < i)) {
          startTitle = i;
        }
        else {
          startTitle = i;
        }
      }
    }
    tit = title[startTitle];
    for(var i in title.keys){
      if(i >= startTitle) {
        String str = title[i];
        title.remove(i);
        i--;
        title[i] = str;
      }
    }
  }

  @override
  State<StatefulWidget> createState() => _PracticeSymbol();
}

class _PracticeSymbol extends State<PracticeSymbol>{

  _PracticeSymbol(){
    widget.rand(symbol, title);
  }

  Symbol symbol;
  String title;

  @override
  Widget build(BuildContext context){
    return LetterScreen(
        titleSymbol: title,
        symbol: symbol.getChar(),
        previousPage: AppModel.navigationScreens[navigation.DictionaryScreen],
        helpPage:  LetterViewHelp(),
    );
  }
}*/

class PracticeButtonWidget extends StatefulWidget {
  const PracticeButtonWidget({
    Key key,
    @required this.practiceButton,
  }) : super(key: key);

  final MenuButton practiceButton;

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
          Practice.addSymbolGroup(widget.practiceButton.name);
        } else {
          Practice.removeSymbolGroup(widget.practiceButton.name);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.practiceButton.name,
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
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              child: AutoSizeText(
                widget.practiceButton.name,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: ScreenParams.height(2.0, context),
            ),
            DecoratedIcon(
              widget.practiceButton.icon,
              color: CupertinoColors.white,
              size: 48.0,
              shadows: <Shadow>[
                Styles.buildButtonShadow(),
                for(var stroke in Styles.buildStroke(0.25))
                  stroke,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Checkbox(
                  value: checkBox,
                  onChanged: (bool val) {
                    onChanged(val);
                  },
                ),
              ],
            ),
          ],
        ),
        onPressed: () {
          onChanged(!checkBox);
        },
      ),
    );
  }
}
