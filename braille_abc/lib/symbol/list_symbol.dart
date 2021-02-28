import 'package:flutter/material.dart';

class Image_Symbol{
  List<bool> data = <bool>[false, false, false, false, false, false];
  final String char;
  Image_Symbol({List<int> d, this.char}){
    for(int i = 0; i < d.length; i++){
      data[d[i] - 1] = true;
    }
  }
}

List<Image_Symbol> list_Symbols = <Image_Symbol>[
  Image_Symbol(d: <int>[1], char: 'А'),
  Image_Symbol(d: <int>[1, 2], char: 'Б'),
  Image_Symbol(d: <int>[2, 4, 5, 6], char: 'В'),
];

class Search{
  static Element(String char){
    if(char == null)
      return <bool>[false, false, false, false, false, false];
    for(int i = 0; i < list_Symbols.length; i++){
      if(list_Symbols[i].char.compareTo(char) == 0){
        return list_Symbols[i].data;
      }
    }
    return <bool>[false, false, false, false, false, false];
  }
}