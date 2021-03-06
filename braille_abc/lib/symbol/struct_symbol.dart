import 'package:braille_abc/models/app_names.dart';
import 'package:flutter/foundation.dart';
import 'package:braille_abc/symbol/list_symbols.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:braille_abc/style.dart';

class DotImage {
  Color p = AppColors.dotOnPress;
  Color onP = AppColors.dotPress;
  bool press = false;
  String outputData;
  int num;
  DotImage(this.num, bool isPress){
    outputData = num.toString();
    if(isPress) {
      setIsPressed(true);
    }
  }

  void setIsPressed(bool state){
    press = state;
    if(press){
      p = AppColors.dotPress;
      onP = AppColors.dotOnPress;
    }
    else{
      p = AppColors.dotOnPress;
      onP = AppColors.dotPress;
    }
  }
}

@immutable
abstract class Symbol {
  final List<DotImage> dots;
  final String char;
  const Symbol({this.dots, this.char});

  List<bool> getDotsInfo() {
    return [for(int i = 0; i < 6; ++i) dots[i].press];
  }

  static Symbol defaultSymbol(){
    return RussianSymbol(list: Search.imageSymbol(d: <int>[]), char: "No");
  }

  String dotsToString() {
    StringBuffer str =  StringBuffer(char + ": точки ");
    for(var d in dots){
      if(d.press) {
        str.write(d.outputData + ", ");
      }
    }
    // (str.length - 2) is used to remove the last punctuation from output
    return str.toString().substring(0, str.length - 2);
  }

  String getChar(){
    return char;
  }


  String getShortChar(){
    return char;
  }

}

@immutable
class RussianSymbol extends Symbol {
  static final SectionType groupName = SectionType.RussianSymbols;

  const RussianSymbol({String char, List<DotImage> list}) : super(dots: list, char: char);
}

@immutable
class PunctuationSymbol extends Symbol {
  static final SectionType groupName = SectionType.PunctuationSymbols;
  final String shortChar;
  const PunctuationSymbol({String char, List<DotImage> list, this.shortChar}) : super (dots: list, char: char);

  @override
  String getShortChar(){
    return shortChar;
  }

}

@immutable
class ArithmeticSymbol extends Symbol {
  static final SectionType groupName = SectionType.ArithmeticSymbols;
  final String shortChar;
  const ArithmeticSymbol({String char, List<DotImage> list, this.shortChar}) : super (dots: list, char: char);

  @override
  String getShortChar(){
    return shortChar;
  }
}

@immutable
class Number extends Symbol{
  static final SectionType groupName = SectionType.Numbers;

  const Number({String char, List<DotImage> list}) : super (dots: list, char: char);

}

@immutable
class Sign extends Symbol{
  static final SectionType groupName = SectionType.Signs;

  const Sign({List<DotImage> list, String char}) : super (dots: list, char: char);

}

class StudySymbol extends Symbol{
  const StudySymbol({List<DotImage> list}) : super (dots: list, char: "No");
}
