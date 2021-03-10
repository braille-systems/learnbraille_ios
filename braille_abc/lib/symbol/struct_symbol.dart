import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Point{
  Color p = CupertinoColors.white;
  Color onP = CupertinoColors.black;
  bool press = false;
  String data;
  int num;
  Point(this.data, this.num);
}

class StructSymbol{
  List<Point> data = <Point>[Point('1', 1), Point('4', 4), Point('2', 2), Point('5', 5), Point('3', 3), Point('6', 6)];
  String char;
  List<int> l;
  StructSymbol({List<bool> list, this.char}){
    for(int i = 0; i < list.length; i++){
      for(int j = 0; j < data.length; j++) {
        if(data[j].num == i + 1) {
          data[j].press = list[i];
          if (data[j].press) {
            data[j].p = CupertinoColors.black;
            data[j].onP = CupertinoColors.white;
          }
        }
      }
    }
    int j = 0;
    for(int i = 0; i < data.length; i++){
      if(data[i].p == CupertinoColors.black){
        l[j] = i;
        j++;
      }
    }
  }
  String toString(){
    String str = char;
    str += ": точки ";
    for(int i = 0; i < l.length; i++){
      str += l[i].toString() + ", ";
    }
    return str;
  }
}
