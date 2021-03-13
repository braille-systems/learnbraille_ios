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
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 2, 4, 5]), char: "Г"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 4, 5]), char: "Д"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 5]), char: "Е"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 6]), char: "Ё"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[2, 4, 5]), char: "Ж"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 3, 5, 6]), char: "З"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[2, 4]), char: "И"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 2, 3, 4, 6]), char: "Й"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 3]), char: "К"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 2, 3]), char: "Л"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 3, 4]), char: "М"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 3, 4, 5]), char: "Н"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 3, 5]), char: "О"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 2, 3, 4]), char: "П"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 2, 3, 5]), char: "Р"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[2, 3, 4]), char: "С"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[2, 3, 4, 5]), char: "Т"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 3, 6]), char: "У"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 2, 4]), char: "Ф"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 2, 5]), char: "Х"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 4]), char: "Ц"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 2, 3, 4, 5]), char: "Ч"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 5, 6]), char: "Ш"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 3, 4, 6]), char: "Щ"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 2, 3, 5, 6]), char: "Ъ"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[2, 3, 4, 6]), char: "Ы"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[2, 3, 4, 5, 6]), char: "Ь"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[2, 4, 6]), char: "Э"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 2, 5, 6]), char: "Ю"),
            RussianSymbol(list: Search.imageSymbol(d: <int>[1, 2, 4, 6]), char: "Я"),
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
      case "Цифры":
        {
          List<StructSymbol> numbers = <StructSymbol>[
            Numbers(list: Search.imageSymbol(d: <int>[1]), char: "1"),
            Numbers(list: Search.imageSymbol(d: <int>[1, 2]), char: "2"),
            Numbers(list: Search.imageSymbol(d: <int>[1, 4]), char: "3"),
            Numbers(list: Search.imageSymbol(d: <int>[1, 4, 5]), char: "4"),
            Numbers(list: Search.imageSymbol(d: <int>[1, 5]), char: "5"),
            Numbers(list: Search.imageSymbol(d: <int>[1, 2, 4]), char: "6"),
            Numbers(list: Search.imageSymbol(d: <int>[1, 2, 4, 5]), char: "7"),
            Numbers(list: Search.imageSymbol(d: <int>[1, 2, 5]), char: "8"),
            Numbers(list: Search.imageSymbol(d: <int>[2, 4]), char: "9"),
            Numbers(list: Search.imageSymbol(d: <int>[2, 4, 5]), char: "0"),
          ];
          return numbers;
        }
        break;
      case "Признаки":
        {
          List<StructSymbol> signs = <StructSymbol>[
            Signs(list: Search.imageSymbol(d: <int>[3, 4, 5, 6]), char: "Цифровой знак"),
            Signs(list: Search.imageSymbol(d: <int>[4, 5, 6]), char: "Признак курсивного шрифта"),
            Signs(list: Search.imageSymbol(d: <int>[1, 2, 4, 5, 6]), char: "Признак жирного шрифта"),
            Signs(list: Search.imageSymbol(d: <int>[4, 5]), char: "Признак большой русской буквы"),
            Signs(list: Search.imageSymbol(d: <int>[6]), char: "Признак малой латинской буквы"),
            Signs(list: Search.imageSymbol(d: <int>[4, 6]), char: "Признак большой латинской буквы"),
          ];
          return signs;
        }
        break;
    }
    return null;
  }
}

class Alphabet {
  Alphabet() {
    if (_alphabet == null) {
      final List<String> tokens = <String>[
        "Русский алфавит",
        "Знаки препинания",
        "Арифметические знаки",
        "Цифры",
        "Признаки",
      ];
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
        lsi.add(StudyItem(
            symbolData: symbol.stringPoints(), titleSymbol: symbol.ofGroup()));
      }
    }
    return lsi;
  }

  static Map<String, List<StructSymbol>> _alphabet;
}

class Search {
  static StructSymbol element(String ch, String keymap) {
    assert(ch != null);
    Alphabet alphabet = Alphabet();
    List<StructSymbol> list = alphabet.listOfSymbols(keymap);

    for (int i = 0; i < list.length; i++) {
      if (list[i].char.compareTo(ch) == 0) {
        return list[i];
      }
    }
    return null;
  }

  static List<Dot> imageSymbol({List<int> d}) {
    List<Dot> data = <Dot>[Dot(1, false), Dot(2, false), Dot(3, false), Dot(4, false), Dot(5, false), Dot(6, false)];
    for (int i = 0; i < d.length; i++) {
      data[d[i] - 1].isPressed();
    }
    return data;
  }
}
