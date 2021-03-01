import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'struct_symbol.dart';
import 'list_symbols.dart';

class Symbol extends StatefulWidget{
  double Width;//ширина
  double Height ;//высота
  double location_y;//принимает знаения от -1 до 1, и меняет координату по y: -1 - в самом верху, 1 - нижняя часть виджета соприкасается с нижней частью экрана
  String char;//отвчает за символ, который будет печататься, если же символ печататься не должен, писать null
  final bool tap;//реакция на нажатие
  TextDirection dir = TextDirection.ltr;//направление печати цифр

  Symbol({Key key, this.dir, this.char, this.tap, this.Width, this.Height, this.location_y}): super(key: key){
  }

  @override
  _SymbolState createState() => _SymbolState(this.dir, this.char, this.tap, this.Width, this.Height, this.location_y);
}

class _SymbolState extends State<Symbol>{
  double Width = 250;//ширина
  double Height = 400;//высота
  double location_y = 0.7;
  TextDirection dir = TextDirection.ltr;
  final bool tap;
  Struct_Symbol symbol;

  _SymbolState(this.dir, String char, this.tap, this.Width, this.Height, this.location_y){
    symbol = Search.Element(char);
  }

  void Exchange(){
    if(dir == TextDirection.ltr)
      dir = TextDirection.rtl;
    else
      dir = TextDirection.ltr;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, location_y),
      child: Stack(
        textDirection: dir,
        children: <Widget>[
          Container(
              height: Height,
              width: Width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.orange[300],
              ),

              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                textDirection: dir,
                spacing: 30,
                runSpacing: 0,
                children: symbol.data
                    .map((item) =>
                    ElevatedButton(
                      onPressed: () {
                        if(this.tap) {
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
                        side: BorderSide(width: 10, color: CupertinoColors.black),
                        padding: EdgeInsets.all(20),
                      ),
                      child: Text(item.data, textDirection: TextDirection.ltr, style: TextStyle(fontSize: 0.3 * Width)),
                    ))
                    .toList(),
              )
          ) ,
        ],
      ),
    );
  }
}