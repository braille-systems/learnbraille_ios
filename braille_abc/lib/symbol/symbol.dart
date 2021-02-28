import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Point{
  Color p = CupertinoColors.white;
  Color onP = CupertinoColors.black;
  bool press = false;
  String data;
  Point(this.data);
}

class Symbol extends StatefulWidget{
  TextDirection dir = TextDirection.ltr;

  Symbol({Key key, this.dir}): super(key: key){
  }

  @override
  _SymbolState createState() => _SymbolState(this.dir);
}

class _SymbolState extends State<Symbol>{
  double Width = 250;
  double Height = 400;
  TextDirection dir = TextDirection.ltr;
  List<Point> points = <Point>[Point('1'), Point('4'), Point('2'), Point('5'), Point('3'), Point('6')];

  _SymbolState(TextDirection direct){
    dir = direct;
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
                    .map((item) => //item.data == 'divider'
                ElevatedButton(
                  //color: p = Colors.white
                  onPressed: () {
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
