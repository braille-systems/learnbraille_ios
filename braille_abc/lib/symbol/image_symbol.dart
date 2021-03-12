import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'struct_symbol.dart';
import 'list_symbols.dart';


class Symbol extends StatefulWidget {
  final double width;
  final double height;
  final String char;
  final String dictSection;
  final bool isTapped;
  final TextDirection Function() textDir;

  Symbol(
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

class _SymbolState extends State<Symbol> {
  StructSymbol symbol;

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
              spacing: 0,
              direction: Axis.vertical,
              runSpacing: 30,
              //verticalDirection: VerticalDirection.up,
              children: symbol.data
                  .map(
                    (item) => ElevatedButton(
                  onPressed: () {
                    if (widget.isTapped) {
                      setState(() {
                        if (item.p == CupertinoColors.white)
                          item.p = CupertinoColors.black;
                        else
                          item.p = CupertinoColors.white;
                        if (item.onP == CupertinoColors.black)
                          item.onP = CupertinoColors.white;
                        else
                          item.onP = CupertinoColors.black;
                        item.press = !(item.press);
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: item.p,
                    onPrimary: item.onP,
                    shape: CircleBorder(),
                    side:
                    BorderSide(width: 10, color: CupertinoColors.black),
                    padding: EdgeInsets.all(20),
                  ),
                  child: Text(item.data,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(fontSize: 0.3 * widget.width)),
                ),
              )
                  .toList(growable: false),
            ),
          ),
        ],
      ),
    );
  }
}
