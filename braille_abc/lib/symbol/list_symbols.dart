import 'struct_symbol.dart';

final List<StructSymbol> listSymbols = <StructSymbol>[
  StructSymbol(list: Search.ImageSymbol(d: <int> []), char: null),
  StructSymbol(list: Search.ImageSymbol(d: <int> [1]), char: 'А'),
  StructSymbol(list: Search.ImageSymbol(d: <int> [1, 2]), char: 'Б'),
  StructSymbol(list: Search.ImageSymbol(d: <int>[2, 4, 5, 6]), char: 'В'),
];

class Search {
  // ignore: non_constant_identifier_names
  static StructSymbol Element(String ch){
    if(ch == null)
      return listSymbols[0];
    for(int i = 1; i < listSymbols.length; i++){
      if(listSymbols[i].char.compareTo(ch) == 0){
        return listSymbols[i];
      }
    }
    return listSymbols[0];
  }

  // ignore: non_constant_identifier_names
  static List<bool> ImageSymbol({List<int> d}) {
    List<bool> data = <bool>[false, false, false, false, false, false];
    for (int i = 0; i < d.length; i++) {
      data[d[i] - 1] = true;
    }
    return data;
  }
}
