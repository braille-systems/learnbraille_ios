import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'list_symbol.dart';

void main() => runApp(CupertinoApp(
  home: Symbol(dir: TextDirection.ltr, char: null, tap: true, Width: 200, Height: 350, location_y: 0.7)
),);

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
  double location_y;//принимает знаения от -1 до 1, и меняет координату по y: -1 - в самом верху, 1 - нижняя часть виджета соприкасается с нижней частью экрана
  List<bool> bl;//отвчает за символ, который будет печататься, если же символ печататься не должен, писать null
  final bool tap;//реакция на нажатие
  TextDirection dir = TextDirection.ltr;//направление печати цифр

  Symbol({Key key, this.dir, String char, this.tap, this.Width, this.Height, this.location_y}): super(key: key){
    bl = Search.Element(char);
  }

  @override
  _SymbolState createState() => _SymbolState(this.dir, this.bl, this.tap, this.Width, this.Height, this.location_y);
}

class _SymbolState extends State<Symbol>{
  double Width = 250;//ширина
  double Height = 400;//высота
  double location_y = 0.7;
  TextDirection dir = TextDirection.ltr;
  final bool tap;
  List<Point> points = <Point>[Point('1', 1), Point('4', 4), Point('2', 2), Point('5', 5), Point('3', 3), Point('6', 6)];

  _SymbolState(this.dir, List<bool> bl, this.tap, this.Width, this.Height, this.location_y){
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