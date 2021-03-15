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
              spacing: 30,
              direction: Axis.vertical,
              runSpacing: 0,
              children: symbol.dots
                  .map((item) => Semantics(
                        label: "Точка" + item.data + (item.press ? "закрашена" : "не закрашена"),
                        button: false,
                        child: ElevatedButton(
                          onPressed: () {
                            if (widget.isTapped) {
                              setState(() {
                                item.p = (item.press ? CupertinoColors.black : CupertinoColors.white);
                                item.onP = (item.press ? CupertinoColors.white : CupertinoColors.black);
                                item.press = !item.press;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: item.p,
                            onPrimary: item.onP,
                            shape: CircleBorder(),
                            side: BorderSide(width: 10, color: CupertinoColors.black),
                            padding: EdgeInsets.all(20),
                          ),
                          child: Text(item.outputData,
                              textDirection: TextDirection.ltr, style: TextStyle(fontSize: 0.3 * widget.width)),
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
