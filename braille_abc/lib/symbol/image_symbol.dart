import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'struct_symbol.dart';
import 'list_symbols.dart';

class SymbolWidget extends StatefulWidget {
  final double width;
  final double height;
  final String char;
  final String dictSection;
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
  _SymbolState createState() => _SymbolState(char: char, dictSection: dictSection);
}

class _SymbolState extends State<SymbolWidget> {
  Symbol symbol;

  _SymbolState({String char, String dictSection}) {
    symbol = Search.element(char, dictSection);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
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
              spacing: 25.0 / 667 * widget.height,
              direction: Axis.vertical,
              runSpacing: 16.0 / 667 * widget.height,
              children: symbol.dots
                  .map((item) => Semantics(
                        label: "Точка" + item.outputData + (item.press ? "закрашена" : "не закрашена"),
                        button: false,
                       child: Container(
                         height: 80.0 / 330 * widget.height,
                         width: 80.0 / 330 * widget.height,
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           border: Border.all(
                             color: item.onP,
                             width: 10,
                           ),
                         ),
                         child: CupertinoButton(
                            onPressed: () {
                              if (widget.isTapped) {
                                setState(() {
                                  item.p = (item.press ? CupertinoColors.black : CupertinoColors.white);
                                  item.onP = (item.press ? CupertinoColors.white : CupertinoColors.black);
                                  item.press = !item.press;
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
      ),
    );
  }
}
