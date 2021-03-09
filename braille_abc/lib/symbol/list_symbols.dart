import 'struct_symbol.dart';

final List<StructSymbol> russian = <StructSymbol>[
  StructSymbol(list: Search.imageSymbol(d: <int> [1]), char: 'А'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 2]), char: 'Б'),
  StructSymbol(list: Search.imageSymbol(d: <int>[2, 4, 5, 6]), char: 'В'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 4, 5]), char: 'Г'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 4, 5]), char: 'Д'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 5]), char: 'Е'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 6]), char: 'Ё'),
  StructSymbol(list: Search.imageSymbol(d: <int> [2, 4, 5]), char: 'Ж'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 3, 5, 6]), char: 'З'),
  StructSymbol(list: Search.imageSymbol(d: <int> [2, 4]), char: 'И'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 3, 4, 6]), char: 'Й'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 3]), char: 'К'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 3]), char: 'Л'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 3, 4]), char: 'М'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 3, 4, 5]), char: 'Н'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 3, 5]), char: 'О'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 3, 4]), char: 'П'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 3, 5]), char: 'Р'),
  StructSymbol(list: Search.imageSymbol(d: <int> [2, 3, 4]), char: 'С'),
  StructSymbol(list: Search.imageSymbol(d: <int> [2, 3, 4, 5]), char: 'Т'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 3, 6]), char: 'У'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 4]), char: 'Ф'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 5]), char: 'Х'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 4]), char: 'Ц'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 3, 4, 5]), char: 'Ч'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 4, 5]), char: 'Ш'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 3, 4, 6]), char: 'Щ'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 3, 5, 6]), char: 'Ъ'),
  StructSymbol(list: Search.imageSymbol(d: <int> [2, 3, 4, 6]), char: 'Ы'),
  StructSymbol(list: Search.imageSymbol(d: <int> [2, 3, 4, 5, 6]), char: 'Ь'),
  StructSymbol(list: Search.imageSymbol(d: <int> [2, 4, 6]), char: 'Э'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 5, 6]), char: 'Ю'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 4, 6]), char: 'Я'),
];

class Search {

  static final String rus = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЪЭЮЯ";


  static StructSymbol element(String ch){
    if(ch == null)
      return StructSymbol(list: Search.imageSymbol(d: <int> []), char: null);
    if(rus.contains(ch)){
      for(int i = 0; i < russian.length; i++){
        if(russian[i].char.compareTo(ch) == 0)
          return russian[i];
      }
    }
    return StructSymbol(list: Search.imageSymbol(d: <int> []), char: null);
  }
  static List<bool> imageSymbol({List<int> d}) {
    List<bool> data = <bool>[false, false, false, false, false, false];
    for (int i = 0; i < d.length; i++) {
      data[d[i] - 1] = true;
    }
    return data;
  }
}