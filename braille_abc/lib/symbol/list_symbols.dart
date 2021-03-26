import 'package:braille_abc/components/study_item_widget.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';

class SymbolsFactory {
  SymbolsFactory();

  List<Symbol> createSymbolsGroup(final SectionType groupName) {
    switch (groupName) {
      case SectionType.RussianSymbols:
        {
          List<Symbol> russian = <Symbol>[
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
      case SectionType.PunctuationSymbols:
        {
          List<Symbol> punctuationMarks = <Symbol>[
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

      case SectionType.ArithmeticSymbols:
        {
          List<Symbol> arithmeticSigns = <Symbol>[
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
      case SectionType.Numbers:
        {
          List<Symbol> numbers = <Symbol>[
            Number(list: Search.imageSymbol(d: <int>[1]), char: "1"),
            Number(list: Search.imageSymbol(d: <int>[1, 2]), char: "2"),
            Number(list: Search.imageSymbol(d: <int>[1, 4]), char: "3"),
            Number(list: Search.imageSymbol(d: <int>[1, 4, 5]), char: "4"),
            Number(list: Search.imageSymbol(d: <int>[1, 5]), char: "5"),
            Number(list: Search.imageSymbol(d: <int>[1, 2, 4]), char: "6"),
            Number(list: Search.imageSymbol(d: <int>[1, 2, 4, 5]), char: "7"),
            Number(list: Search.imageSymbol(d: <int>[1, 2, 5]), char: "8"),
            Number(list: Search.imageSymbol(d: <int>[2, 4]), char: "9"),
            Number(list: Search.imageSymbol(d: <int>[2, 4, 5]), char: "0"),
          ];
          return numbers;
        }
        break;
      case SectionType.Signs:
        {
          List<Symbol> signs = <Symbol>[
            Sign(list: Search.imageSymbol(d: <int>[3, 4, 5, 6]), char: "Цифровой знак"),
            Sign(list: Search.imageSymbol(d: <int>[4, 5, 6]), char: "Признак курсивного шрифта"),
            Sign(list: Search.imageSymbol(d: <int>[1, 2, 4, 5, 6]), char: "Признак жирного шрифта"),
            Sign(list: Search.imageSymbol(d: <int>[4, 5]), char: "Признак большой русской буквы"),
            Sign(list: Search.imageSymbol(d: <int>[6]), char: "Признак малой латинской буквы"),
            Sign(list: Search.imageSymbol(d: <int>[4, 6]), char: "Признак большой латинской буквы"),
          ];
          return signs;
        }
        break;
    }
    return null;
  }
}

class Alphabet {
  static Map<SectionType, List<Symbol>> _alphabet;

  Alphabet() {
    if (_alphabet == null) {
      SymbolsFactory factory = SymbolsFactory();
      _alphabet = Map();
      for (var token in SectionNames.stringOfSectionsMap.keys) {
        _alphabet[token] = factory.createSymbolsGroup(token);
      }
    }
  }

  List<Symbol> listOfSymbols(SectionType key) {
    if (_alphabet.containsKey(key)) {
      return _alphabet[key];
    }
    return null;
  }

  List<StudyItem> listOfStudyItems(SectionType key) {
    List<StudyItem> lsi = [];
    List<Symbol> los = listOfSymbols(key);
    for (var symbol in los) {
      if (symbol.char != null) {
        lsi.add(StudyItem(symbol: symbol, sectionName: key));
      }
    }
    return lsi;
  }
}

class Search {
  static Symbol element(String ch, SectionType keymap) {
    Alphabet alphabet = Alphabet();
    List<Symbol> list = alphabet.listOfSymbols(keymap);

    for (int i = 0; i < list.length; i++) {
      if (list[i].char.compareTo(ch) == 0) {
        return list[i];
      }
    }
    return null;
  }

  static List<DotImage> imageSymbol({List<int> d}) {
    List<DotImage> data = <DotImage>[
      DotImage(1, false),
      DotImage(2, false),
      DotImage(3, false),
      DotImage(4, false),
      DotImage(5, false),
      DotImage(6, false)
    ];
    for (int i = 0; i < d.length; i++) {
      data[d[i] - 1].setIsPressed(true);
    }
    return data;
  }
}
