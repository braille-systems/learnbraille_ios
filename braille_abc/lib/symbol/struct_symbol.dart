import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class Dot {
  Color p = CupertinoColors.white;
  Color onP = CupertinoColors.black;
  bool press = false;
  String data;
  int num;
  Dot(this.num, bool isPress){
    data = num.toString();
    if(isPress)
      this.isPressed();
  }

  void isPressed(){
    press = !press;
    if(p == CupertinoColors.white)
      p = CupertinoColors.black;
    else
      p = CupertinoColors.white;
    if(onP == CupertinoColors.white)
      onP = CupertinoColors.black;
    else
      onP = CupertinoColors.white;
  }
}

abstract class StructSymbol {
  final List<Dot> data = <Dot>[Dot(1, false), Dot(2, false), Dot(3, false), Dot(4, false), Dot(5, false), Dot(6, false)];
  final String char;

  StructSymbol({List<Dot> inputData, this.char = " "}){
    if(inputData.isNotEmpty){
     if(inputData.length == data.length){
       for(int i = 0; i < data.length; i++){
         if(inputData[i].press)
           data[inputData[i].num - 1].isPressed();
       }
     }
    }
  }

  List<Dot> set(){
    return data;
  }

  String stringPoints() {
    StringBuffer str = new StringBuffer(char + ": ");
    for(var d in data){
      if(d.press)
        str.write(d.data + ", ");
    }
    return str.toString().substring(0, str.length - 2);
  }

  String ofGroup();

}

class RussianSymbol extends StructSymbol {
  static final String groupName = "Русский алфавит";

  RussianSymbol({List<Dot> list, String char}) : super(inputData: list, char: char);

  String ofGroup() {
    return groupName;
  }
}

class PunctuationSymbol extends StructSymbol {
  static final String groupName = "Знаки препинания";

  PunctuationSymbol({List<Dot> list, String char}) : super (inputData: list, char: char);

  String ofGroup() {
    return groupName;
  }
}

class ArithmeticSymbol extends StructSymbol {
  static final String groupName = "Арифметические знаки";

  ArithmeticSymbol({List<Dot> list, String char}) : super (inputData: list, char: char);

  String ofGroup() {
    return groupName;
  }
}

class Numbers extends StructSymbol{
  static final String groupName = "Цифры";

  Numbers({List<Dot> list, String char}) : super (inputData: list, char: char);

  String ofGroup() {
    return groupName;
  }
}

class Signs extends StructSymbol{
  static final String groupName = "Признаки";

  Signs({List<Dot> list, String char}) : super (inputData: list, char: char);

  String ofGroup() {
    return groupName;
  }
}