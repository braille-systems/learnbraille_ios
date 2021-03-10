import 'struct_symbol.dart';


class SymbolsFactory {
  SymbolsFactory() {}
  List<StructSymbol> createSymbolsGroup(final String groupName) {
    switch (groupName) {
      case "Русский алфавит":
        {
          List<StructSymbol> russian = <StructSymbol>[
            StructSymbol(list: Search.imageSymbol(d: <int>[1]), char: 'А'),
            StructSymbol(list: Search.imageSymbol(d: <int>[1, 2]), char: 'Б'),
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
            StructSymbol(list: Search.imageSymbol(d: <int> [1, 5, 6]), char: 'Ш'),
            StructSymbol(list: Search.imageSymbol(d: <int> [1, 3, 4, 6]), char: 'Щ'),
            StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 3, 5, 6]), char: 'Ъ'),
            StructSymbol(list: Search.imageSymbol(d: <int> [2, 3, 4, 6]), char: 'Ы'),
            StructSymbol(list: Search.imageSymbol(d: <int> [2, 3, 4, 5, 6]), char: 'Ь'),
            StructSymbol(list: Search.imageSymbol(d: <int> [2, 4, 6]), char: 'Э'),
            StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 5, 6]), char: 'Ю'),
            StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 4, 6]), char: 'Я'),
          ];
          return russian;
        }
        break;

      case "Знаки препинания":
        {
           List<StructSymbol> punctuationMarks = <StructSymbol>[
            StructSymbol(
                list: Search.imageSymbol(d: <int>[2]), char: 'Запятая'),
            StructSymbol(
                list: Search.imageSymbol(d: <int>[3, 6]), char: 'Дефис'),
            StructSymbol(
                list: Search.imageSymbol(d: <int>[2, 5, 6]), char: 'Точка'),
            StructSymbol(list: Search.imageSymbol(d: <int>[2, 3, 5]),
                char: 'Восклицательный знак'),
            StructSymbol(list: Search.imageSymbol(d: <int>[2, 6]),
                char: 'Вопросительный знак'),
            StructSymbol(list: Search.imageSymbol(d: <int>[2, 3, 6]),
                char: 'Открывающая кавычка'),
            StructSymbol(list: Search.imageSymbol(d: <int>[3, 5, 6]),
                char: 'Закрывающая кавычка'),
            StructSymbol(list: Search.imageSymbol(d: <int>[1, 2, 6]),
                char: 'Левая литеральная скобка'),
            StructSymbol(list: Search.imageSymbol(d: <int>[3, 4, 5]),
                char: 'Правая литеральная скобка'),
            StructSymbol(
                list: Search.imageSymbol(d: <int>[3, 5]), char: 'Звёздочка'),
            StructSymbol(
                list: Search.imageSymbol(d: <int>[2, 5]), char: 'Двоеточие'),
            StructSymbol(list: Search.imageSymbol(d: <int>[2, 3]),
                char: 'Точка с запятой'),
            StructSymbol(
                list: Search.imageSymbol(d: <int>[4]), char: 'Ударение'),
          ];
          return punctuationMarks;
        }
    }
    return null;
  }
}

class Alphabet {
  Alphabet() {
    final List<String> tokens = <String>["Русский алфавит", "Знаки препинания"];
    SymbolsFactory factory = SymbolsFactory();
    for(var token in tokens) {
      //alphabet.addEntries(newEntries: {token, factory.createSymbolsGroup(token)})
      //alphabet.add(token, factory.createSymbolsGroup(token));
      alphabet[token] = factory.createSymbolsGroup(token);
    }
  }

  listOfSymbols(String key) {
    if(alphabet.containsKey(key)) {
      return alphabet[key];
    }
    return null;
  }

  Map<String, List<StructSymbol>> alphabet = Map();
}
/*final List<StructSymbol> russian = <StructSymbol>[
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
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 5, 6]), char: 'Ш'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 3, 4, 6]), char: 'Щ'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 3, 5, 6]), char: 'Ъ'),
  StructSymbol(list: Search.imageSymbol(d: <int> [2, 3, 4, 6]), char: 'Ы'),
  StructSymbol(list: Search.imageSymbol(d: <int> [2, 3, 4, 5, 6]), char: 'Ь'),
  StructSymbol(list: Search.imageSymbol(d: <int> [2, 4, 6]), char: 'Э'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 5, 6]), char: 'Ю'),
  StructSymbol(list: Search.imageSymbol(d: <int> [1, 2, 4, 6]), char: 'Я'),
];*/

class Search {

  static final String rus = "Русский алфавит";

  /*static final Map<String, List<StructSymbol>> map = {
    rus : russian,
  };*/

  static StructSymbol element(String ch, String keymap){
    if(ch == null)
      return StructSymbol(list: Search.imageSymbol(d: <int> []), char: null);
    Alphabet alph = Alphabet();
    List<StructSymbol> list = alph.listOfSymbols(keymap);
    for(int i = 0; i < list.length; i++){
      if(list[i].char.compareTo(ch) == 0)
        return list[i];
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