import 'dart:ui';

import 'package:braille_abc/models/app_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';
import 'package:braille_abc/symbol/list_symbols.dart';

class SymbolWidget extends StatefulWidget {
  final double width;
  final double height;
  final String char;
  final SectionType dictSection;
  final bool isTapped;
  final TextDirection Function() textDir;

  SymbolWidget(
      {Key key,
      @required this.textDir,
      @required this.char,
      @required this.dictSection,
      @required this.isTapped,
      @required this.width,
      @required this.height})
      : super(key: key) {
    createState();
  }

  @override
  _SymbolState createState() => _SymbolState(char: char, dictSection: dictSection, isTapped: isTapped);
}

class _SymbolState extends State<SymbolWidget> {
  Symbol symbol;
  final bool isTapped;

  _SymbolState({String char, SectionType dictSection, @required this.isTapped}) {
    if(!isTapped) {
      symbol = Search.element(char, dictSection);
    }
    else {
      symbol = Symbol.defaultSymbol();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        textDirection: widget.textDir(),
        children: <Widget>[
          Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.orange[300],
            ),
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              textDirection: widget.textDir(),
              spacing: 55.0 / 667 * widget.height,
              direction: Axis.vertical,
              runSpacing: 40.0 / 667 * widget.height,
              children: symbol.dots
                  .map((item) => Semantics(
                        label: SemanticNames.getName(SemanticsType.Dot) +
                            item.outputData +
                            (item.press
                                ? SemanticNames.getName(SemanticsType.Painted)
                                : SemanticNames.getName(SemanticsType.NotPainted)),
                        button: false,
                       child: Container(
                         height: 75.0 / 330 * widget.height,//all proportions are relative to height and width of widget
                         width: 75.0 / 330 * widget.height,//proportions are made as on the layout: https://www.figma.com/file/pJE5TUjBKvdy2ZmpMnHAS4/Практика
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           border: Border.all(
                             color: CupertinoColors.black,
                             width: 8,
                           ),
                         ),
                         child: CupertinoButton(
                            onPressed: () {
                              if (widget.isTapped) {
                                setState(() {
                                  item.setIsPressed(!item.press);
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
                      ))
                  .toList(growable: false),
            ),
          ),
        ],
    );
  }
}
