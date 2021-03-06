import 'dart:ui';

import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:braille_abc/components/letter_buttons.dart';
import 'package:braille_abc/screens/letter_screen.dart';

class SymbolWidget extends StatefulWidget {
  final double width;
  final double height;
  final Symbol symbol;
  final SectionType dictSection;
  final bool isTapped;
  final TextDirection Function() textDir;
  final ScreenType screenType;

  SymbolWidget(
      {Key key,
        @required this.textDir,
        @required this.symbol,
        @required this.dictSection,
        @required this.isTapped,
        @required this.width,
        @required this.height,
        @required this.screenType})
      : super(key: key) {
    createState();
  }

  @override
  _SymbolState createState() => _SymbolState(section: dictSection);
}

class _SymbolState extends State<SymbolWidget> {
  Symbol symbol;
  bool lastIsTapped;
  final SectionType section;

  _SymbolState({@required this.section});

  @override
  void initState(){
    super.initState();
    if(!widget.isTapped) {
      symbol = widget.symbol;
    }
    else {
      symbol = Symbol.defaultSymbol();
    }
    lastIsTapped = widget.isTapped;
  }

  @override
  Widget build(BuildContext context) {
    var practiceResource = PracticeResources.of(context);
    bool shouldChangeTaped = true;
    if(practiceResource != null) {
      if(practiceResource.shouldToNextSymbol) {
        shouldChangeTaped = false;
      }
    }
    if(lastIsTapped != widget.isTapped && shouldChangeTaped) {
      if (!widget.isTapped) {
        symbol = widget.symbol;
      }
      else {
        symbol = Symbol.defaultSymbol();
      }
      lastIsTapped = widget.isTapped;
    }

    return Stack(
      textDirection: widget.textDir(),
      children: <Widget>[
        Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.first,
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            textDirection: widget.textDir(),
            spacing: 55.0 / 667 * widget.height,
            direction: Axis.vertical,
            runSpacing: 45.0 / 667 * widget.height,
            children: symbol.dots
                .map((item) => Semantics(
              label: SemanticNames.getName(SemanticsType.Dot) +
                  item.outputData +
                  (item.press
                      ? SemanticNames.getName(SemanticsType.Painted)
                      : SemanticNames.getName(SemanticsType.NotPainted)),
              button: false,
              child: ExcludeSemantics(
                child: Container(
                  height: 75.0 / 330 * widget.height,//all proportions are relative to height and width of widget
                  width: 75.0 / 330 * widget.height,//proportions are made as on the layout: https://www.figma.com/file/pJE5TUjBKvdy2ZmpMnHAS4/Практика
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.dotBoarder,
                      width: 8,
                    ),
                  ),
                  child: CupertinoButton(
                    onPressed: () {
                      if(widget.screenType == ScreenType.Study) {
                        LetterInfo.of(context).setDefaultColor();
                      }
                      if (widget.isTapped) {
                        setState(() {
                          item.setIsPressed(!item.press);
                          PracticeResults.dotClick(int.parse(item.outputData));
                        });
                      }
                    },
                    borderRadius: BorderRadius.all(Radius.circular(1000),),
                    padding: EdgeInsets.zero,
                    color: item.p,
                    child: Text(item.outputData,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(fontSize: 0.18 * widget.height - 8 / 330 * widget.height, color: item.onP, fontWeight: FontWeight.bold)),
                  ),
                ),
              )
            ))
                .toList(growable: false),
          ),
        ),
      ],
    );
  }
}