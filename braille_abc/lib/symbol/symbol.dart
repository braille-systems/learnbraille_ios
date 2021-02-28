import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'list_symbol.dart';

class Point{
  Color p = CupertinoColors.white;
  Color onP = CupertinoColors.black;
  bool press = false;
  String data;
  int num;
  Point(this.data, this.num);
}

class Symbol extends StatefulWidget{
  double Width;//ширина
  double Height ;//высота
  List<bool> bl;//отвчает за символ, который будет печататься, если же символ печататься не должен, писать null
  final bool tap;//реакция на нажатие
  TextDirection dir = TextDirection.ltr;//направление печати цифр

  Symbol({Key key, this.dir, String char,/*List<bool> bl,*/ this.tap, this.Width, this.Height}): super(key: key){
    bl = Search.Element(char);
  }

  @override
  _SymbolState createState() => _SymbolState(this.dir, this.bl, this.tap, this.Width, this.Height);
}

class _SymbolState extends State<Symbol>{
  double Width = 250;//ширина
  double Height = 400;//высота
  TextDirection dir = TextDirection.ltr;
  //final List<bool> bl;
  final bool tap;
  List<Point> points = <Point>[Point('1', 1), Point('4', 4), Point('2', 2), Point('5', 5), Point('3', 3), Point('6', 6)];

  _SymbolState(this.dir, List<bool> bl, this.tap, this.Width, this.Height){
    for(int i = 0; i < bl.length; i++){
      for(int j = 0; j < points.length; j++){
        if((j + 1 == points[i].num) && (bl[j])) {
          points[i].press = true;
          points[i].p = CupertinoColors.black;
          points[i].onP = CupertinoColors.white;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((300.0 - Width) / (2 * 300.0), 0.7),
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
                children: points
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
                      child: Text(item.data, textDirection: TextDirection.ltr, style: TextStyle(fontSize: 65)),
                    ))
                    .toList(),
              )
          ) ,
        ],
      ),
    );
  }
}