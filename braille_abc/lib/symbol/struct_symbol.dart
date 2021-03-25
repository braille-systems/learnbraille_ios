import 'package:braille_abc/models/app_names.dart';
import 'package:flutter/foundation.dart';
import 'list_symbols.dart';
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
      p = CupertinoColors.white;
      onP = CupertinoColors.black;
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

  static Symbol defaultSymbol(){
    return RussianSymbol(list: Search.imageSymbol(d: <int>[]), char: "No");
  }

  String dotsToString() {
    StringBuffer str = new StringBuffer(char + ": точки ");
    for(var d in dots){
      if(d.press)
        str.write(d.outputData + ", ");
    }
    // (str.length - 2) is used to remove the last punctuation from output
    return str.toString().substring(0, str.length - 2);
  }

  String getChar(){
    return char;
  }

}

class RussianSymbol extends Symbol {
  static final SectionType groupName = SectionType.RussianSymbols;

  const RussianSymbol({String char, List<DotImage> list}) : super(dots: list, char: char);
}

class PunctuationSymbol extends Symbol {
  static final SectionType groupName = SectionType.PunctuationSymbols;

  const PunctuationSymbol({String char, List<DotImage> list}) : super (dots: list, char: char);

}

class ArithmeticSymbol extends Symbol {
  static final SectionType groupName = SectionType.ArithmeticSymbols;

  const ArithmeticSymbol({String char, List<DotImage> list}) : super (dots: list, char: char);

}

class Number extends Symbol{
  static final SectionType groupName = SectionType.Numbers;

  const Number({String char, List<DotImage> list}) : super (dots: list, char: char);

}

class Sign extends Symbol{
  static final SectionType groupName = SectionType.Signs;

  const Sign({List<DotImage> list, String char}) : super (dots: list, char: char);

}