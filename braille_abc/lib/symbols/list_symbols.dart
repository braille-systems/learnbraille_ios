import 'struct_symbol.dart';

List<StructSymbol> listSymbols = <StructSymbol>[
  StructSymbol(list: Search.imageSymbol(d: <int> []), char: null),
  StructSymbol(list: Search.imageSymbol(d: <int> [1]), char: 'А'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 2]), char: 'Б'),
  StructSymbol(list: Search.imageSymbol(d: <int>[2, 4, 5, 6]), char: 'В'),
];

class Search {
  static StructSymbol element(String ch){
    if(ch == null)
      return listSymbols[0];
    for(int i = 1; i < listSymbols.length; i++){
      if(listSymbols[i].char.compareTo(ch) == 0){
        return listSymbols[i];
      }
    }
    return listSymbols[0];
  }
  static List<bool> imageSymbol({List<int> d}) {
    List<bool> data = <bool>[false, false, false, false, false, false];
    for (int i = 0; i < d.length; i++) {
      data[d[i] - 1] = true;
    }
    return data;
  }
}
