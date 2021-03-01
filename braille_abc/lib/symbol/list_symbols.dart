import 'struct_symbol.dart';

List<Struct_Symbol> list_Symbols = <Struct_Symbol>[
  Struct_Symbol(list: Search.Image_Symbol(d: <int> []), char: null),
  Struct_Symbol(list: Search.Image_Symbol(d: <int> [1]), char: 'А'),
  Struct_Symbol(list: Search.Image_Symbol(d: <int> [1, 2]), char: 'Б'),
  Struct_Symbol(list: Search.Image_Symbol(d: <int>[2, 4, 5, 6]), char: 'В'),
];

class Search {
  static Struct_Symbol Element(String ch){
    if(ch == null)
      return list_Symbols[0];
    for(int i = 1; i < list_Symbols.length; i++){
      if(list_Symbols[i].char.compareTo(ch) == 0){
        return list_Symbols[i];
      }
    }
    return list_Symbols[0];
  }
  static List<bool> Image_Symbol({List<int> d}) {
    List<bool> data = <bool>[false, false, false, false, false, false];
    for (int i = 0; i < d.length; i++) {
      data[d[i] - 1] = true;
    }
    return data;
  }
}
