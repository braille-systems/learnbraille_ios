import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class DotImage {
  Color p = CupertinoColors.white;
  Color onP = CupertinoColors.black;
  bool press = false;
  String outputData;
  int num;
  DotImage(this.num, bool isPress){
    outputData = num.toString();
    if(isPress)
      this.setIsPressed(true);
  }

  void setIsPressed(bool state){
    press = state;
    if(press){
      p = CupertinoColors.black;
      onP = CupertinoColors.white;
    }
    else{
      p = CupertinoColors.black;
      onP = CupertinoColors.white;
    }
  }
}

@immutable
abstract class Symbol {
  final List<DotImage> dots;
  final String char;
  const Symbol({this.dots, this.char});

  List<DotImage> set(){
    return dots;
  }

  String dotsToString() {
    StringBuffer str = new StringBuffer(char + ": точки ");
    for(var d in dots){
      if(d.press)
        str.write(d.outputData + ", ");
    }
    return str.toString().substring(0, str.length - 2);
  }

  String getChar(){
    return char;
  }

  String ofGroup();

}

class RussianSymbol extends Symbol {
  static final String groupName = "Русский алфавит";

  const RussianSymbol({String char, List<DotImage> list}) : super(dots: list, char: char);

  String ofGroup() {
    return groupName;
  }
}

class PunctuationSymbol extends Symbol {
  static final String groupName = "Знаки препинания";

  const PunctuationSymbol({String char, List<DotImage> list}) : super (dots: list, char: char);

  String ofGroup() {
    return groupName;
  }
}

class ArithmeticSymbol extends Symbol {
  static final String groupName = "Арифметические знаки";

  const ArithmeticSymbol({String char, List<DotImage> list}) : super (dots: list, char: char);

  String ofGroup() {
    return groupName;
  }
}

class Number extends Symbol{
  static final String groupName = "Цифры";

  const Number({String char, List<DotImage> list}) : super (dots: list, char: char);

  String ofGroup() {
    return groupName;
  }
}

class Sign extends Symbol{
  static final String groupName = "Признаки";

  const Sign({List<DotImage> list, String char}) : super (dots: list, char: char);

  String ofGroup() {
    return groupName;
  }
}