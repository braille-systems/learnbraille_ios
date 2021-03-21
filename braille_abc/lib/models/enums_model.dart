
enum SectionType
{
  RussianSymbols,
  Numbers,
  ArithmeticSymbols,
  PunctuationSymbols,
  Signs
}

const Map<SectionType, String> StringOfSectionsMap =
{
  SectionType.RussianSymbols : "Русский алфавит",
  SectionType.Numbers : "Цифры",
  SectionType.ArithmeticSymbols : "Арифметические знаки",
  SectionType.PunctuationSymbols : "Знаки препинания",
  SectionType.Signs : "Признаки"
};

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

const Map<ScreenType, String> StringOfScreensMap =
{
  ScreenType.Dictionary : "Словарь",
  ScreenType.Help : "Справка",
  ScreenType.Home : "Меню", // ?
  ScreenType.Letter : "Просмотр символа",
  ScreenType.Practice: "Практика",
  ScreenType.Settings: "Настройки",
  ScreenType.Study: "Обучение",
};

enum XmlItemType
{
  MainMenu,
  GeneralHelp,
  Alphabet,
  SymbolView,
}

const Map<XmlItemType, String> StringOfXmlItemMap =
{
  XmlItemType.Alphabet : "Алфавит",
  XmlItemType.GeneralHelp : "Общая справка",
  XmlItemType.MainMenu : "Главное меню",
  XmlItemType.SymbolView : "Просмотр символа",
};

enum SemanticsType
{
  ChangeMode,
  Back,
}

const Map<SemanticsType, String> StringOfSemanticsMap =
{
  SemanticsType.ChangeMode : "Изменить режим",
  SemanticsType.Back : "Назад"
};