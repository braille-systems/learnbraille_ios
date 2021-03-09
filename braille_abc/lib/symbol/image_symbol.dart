import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'struct_symbol.dart';
import 'list_symbols.dart';


// ignore: must_be_immutable
class Symbol extends StatefulWidget {
  double width; //ширина
  double height; //высота
  String char; //отвчает за символ, который будет печататься, если же символ печататься не должен, писать null
  bool tap; //реакция на нажатие
  TextDirection Function() dir; //принимает на вход функцию, которая возвращает вид вывода

  Symbol(
      {Key key,
      @required this.dir,
      @required this.char,
      @required this.tap,
      @required this.width,
      @required this.height})
      : super(key: key) {
    createState();
  }

  @override
  _SymbolState createState() => _SymbolState(
      dir: dir, char: char, tap: tap, width: width, height: height);
}

class _SymbolState extends State<Symbol> {
  double width = 250; //ширина
  double height = 400; //высота
  TextDirection Function() dir;
  final bool tap;
  StructSymbol symbol;

  _SymbolState({this.dir, String char, this.tap, this.width, this.height}) {
    symbol = Search.element(char);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        textDirection: dir(),
        children: <Widget>[
          Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.orange[300],
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                textDirection: dir(),
                spacing: 30,
                runSpacing: 0,
                children: symbol.data
                    .map((item) => ElevatedButton(
                          onPressed: () {
                            if (this.tap) {
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
                            side: BorderSide(
                                width: 10, color: CupertinoColors.black),
                            padding: EdgeInsets.all(20),
                          ),
                          child: Text(item.data,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(fontSize: 0.3 * width)),
                        ))
                    .toList(),
              )),
        ],
      ),
    );
  }
}
