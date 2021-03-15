import 'package:braille_abc/components/study_item_widget.dart';

import 'struct_symbol.dart';

class SymbolsFactory {
  SymbolsFactory();

  List<StructSymbol> createSymbolsGroup(final String groupName) {
    switch (groupName) {
      case "Русский алфавит":
        {
          List<StructSymbol> russian = <StructSymbol>[
            RussianSymbol(list: Search.imageSymbol(d: <int>[1]), char: "А"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 2]), char: "Б"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[2, 4, 5, 6]), char: "В"),
          ];
          return russian;
        }
        break;
      case "Знаки препинания":
        {
          List<StructSymbol> punctuationMarks = <StructSymbol>[
            PunctuationSymbol(list: Search.imageSymbol(d: <int>[2]), char: "Запятая"),
            PunctuationSymbol(list: Search.imageSymbol(d: <int>[3, 6]), char: "Дефис"),
            PunctuationSymbol(list: Search.imageSymbol(d: <int>[2, 5, 6]), char: "Точка"),
            PunctuationSymbol(list: Search.imageSymbol(d: <int>[2, 3, 5]), char: "Восклицательный знак"),
            PunctuationSymbol(list: Search.imageSymbol(d: <int>[2, 6]), char: "Вопросительный знак"),
            PunctuationSymbol(list: Search.imageSymbol(d: <int>[2, 3, 6]), char: "Открывающая кавычка"),
            PunctuationSymbol(list: Search.imageSymbol(d: <int>[3, 5, 6]), char: "Закрывающая кавычка"),
            PunctuationSymbol(list: Search.imageSymbol(d: <int>[1, 2, 6]), char: "Левая литеральная скобка"),
            PunctuationSymbol(list: Search.imageSymbol(d: <int>[3, 4, 5]), char: "Правая литеральная скобка"),
            PunctuationSymbol(list: Search.imageSymbol(d: <int>[3, 5]), char: "Звёздочка"),
            PunctuationSymbol(list: Search.imageSymbol(d: <int>[2, 5]), char: "Двоеточие"),
            PunctuationSymbol(list: Search.imageSymbol(d: <int>[2, 3]), char: "Точка с запятой"),
            PunctuationSymbol(list: Search.imageSymbol(d: <int>[4]), char: "Ударение"),
          ];
          return punctuationMarks;
        }
        break;

      case "Арифметические знаки":
        {
          List<StructSymbol> arithmeticSigns = <StructSymbol>[
            ArithmeticSymbol(list: Search.imageSymbol(d: <int>[2, 3, 5]), char: "Знак Плюс"),
            ArithmeticSymbol(list: Search.imageSymbol(d: <int>[3, 6]), char: "Знак Минус"),
            ArithmeticSymbol(list: Search.imageSymbol(d: <int>[3]), char: "Знак умножения точкой"),
            ArithmeticSymbol(list: Search.imageSymbol(d: <int>[2, 3, 6]), char: "Знак умножения крестом"),
            ArithmeticSymbol(list: Search.imageSymbol(d: <int>[3, 5, 6]), char: "Знак деления (углом)"),
            ArithmeticSymbol(list: Search.imageSymbol(d: <int>[2, 5, 6]), char: "Знак деления (двумя точками)"),
            ArithmeticSymbol(list: Search.imageSymbol(d: <int>[2, 3, 5, 6]), char: "Знак равества"),
          ];
          return arithmeticSigns;
        }
        break;
    }
    return null;
  }
}

class Alphabet {
  Alphabet() {
    if (_alphabet == null) {
      final List<String> tokens = <String>["Русский алфавит", "Знаки препинания", "Арифметические знаки"];
      SymbolsFactory factory = SymbolsFactory();
      _alphabet = Map();
      for (var token in tokens) {
        _alphabet[token] = factory.createSymbolsGroup(token);
      }
    }
  }

  List<StructSymbol> listOfSymbols(String key) {
    if (_alphabet.containsKey(key)) {
      return _alphabet[key];
    }
    return null;
  }

  List<StudyItem> listOfStudyItems(String key) {
    List<StudyItem> lsi = [];
    List<StructSymbol> los = listOfSymbols(key);
    for (var symbol in los) {
      if (symbol.char != null) {
        lsi.add(StudyItem(str: symbol.stringPoints(), titleSymbol: symbol.ofGroup()));
      }
    }
    return lsi;
  }

  static Map<String, List<StructSymbol>> _alphabet;
}

class Search {
  // ignore: non_constant_identifier_names
  static StructSymbol element(String ch, String keymap) {
    if (ch == null) {
      return null;
    }
    Alphabet alphabet = Alphabet();
    List<StructSymbol> list = alphabet.listOfSymbols(keymap);

    for (int i = 0; i < list.length; i++) {
      if (list[i].char.compareTo(ch) == 0) {
        return list[i];
      }
    }
    return null;
  }


  static List<bool> imageSymbol({List<int> d}) {
    List<bool> data = <bool>[false, false, false, false, false, false];
    for (int i = 0; i < d.length; i++) {
      data[d[i] - 1] = true;
    }
    return data;
  }
}
