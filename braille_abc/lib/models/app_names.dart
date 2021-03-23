
enum SectionType
{
  RussianSymbols,
  Numbers,
  ArithmeticSymbols,
  PunctuationSymbols,
  Signs
}

class SectionNames
{
  static final Map<SectionType, String> stringOfSectionsMap =
  {
    SectionType.RussianSymbols : "Русский алфавит",
    SectionType.Numbers : "Цифры",
    SectionType.ArithmeticSymbols : "Арифметические знаки",
    SectionType.PunctuationSymbols : "Знаки препинания",
    SectionType.Signs : "Признаки"
  };

  static String getName(SectionType type)
  {
      return stringOfSectionsMap[type];
  }
}


enum ScreenType
{
  Dictionary,
  Help,
  Home,
  Letter,
  Practice,
  Settings,
  Study
}

class ScreenNames
{
  static final Map<ScreenType, String> stringOfScreensMap =
  {
    ScreenType.Dictionary : "Словарь",
    ScreenType.Help : "Справка",
    ScreenType.Home : "Меню", // ?
    ScreenType.Letter : "Просмотр символа",
    ScreenType.Practice: "Практика",
    ScreenType.Settings: "Настройки",
    ScreenType.Study: "Обучение",
  };

  static String getName(ScreenType type)
  {
    return stringOfScreensMap[type];
  }
}


enum XmlItemType
{
  MainMenu,
  GeneralHelp,
  Alphabet,
  SymbolView,
}

class XmlNames
{
  static final Map<XmlItemType, String> stringOfXmlItemMap =
  {
    XmlItemType.Alphabet : "Алфавит",
    XmlItemType.GeneralHelp : "Общая справка",
    XmlItemType.MainMenu : "Главное меню",
    XmlItemType.SymbolView : "Просмотр символа",
  };

  static String getName(XmlItemType type)
  {
    return stringOfXmlItemMap[type];
  }
}

enum SemanticsType
{
  ChangeMode,
  Back,
  Dot,
  Painted,
  NotPainted,
}

class SemanticNames
{
  static final Map<SemanticsType, String> stringOfSemanticsMap =
  {
    SemanticsType.ChangeMode : "Изменить режим",
    SemanticsType.Back : "Назад",
    SemanticsType.Dot: "Точка",
    SemanticsType.Painted : "закрашена",
    SemanticsType.NotPainted : "не закрашена"

  };

  static String getName(SemanticsType type)
  {
    return stringOfSemanticsMap[type];
  }
}



