import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AppIcons
{
  MenuScreen,
  HelpScreen,
  PracticeScreen,
  DictionaryScreen,
  StudyScreen,
  SettingsScreen,

  BackButton,
  ContinueButton,
  ChangeModeButton,
  HintButton,
  NextStep,

  RussianAlphabetSection,
  NumbersSection,
  PunctuationSymbolsSection,
  ArithmeticSymbolsSection,
  SignsSection,

  Add,
  GeneralHelpInHelpScreen,
}

class AppIcon
{
  static const Map<AppIcons, IconData> AppIconsMap =
  {
    AppIcons.MenuScreen : CupertinoIcons.bars,
    AppIcons.HelpScreen : CupertinoIcons.question_circle,
    AppIcons.PracticeScreen : CupertinoIcons.circle_grid_3x3_fill,
    AppIcons.DictionaryScreen : CupertinoIcons.textformat,
    AppIcons.StudyScreen : CupertinoIcons.book,
    AppIcons.SettingsScreen : CupertinoIcons.settings,

    AppIcons.BackButton : CupertinoIcons.back,
    AppIcons.ContinueButton : CupertinoIcons.chevron_right_2,
    AppIcons.ChangeModeButton : CupertinoIcons.arrow_right_arrow_left,
    AppIcons.HintButton : CupertinoIcons.quote_bubble_fill,
    AppIcons.NextStep : CupertinoIcons.arrow_right,

    AppIcons.Add : CupertinoIcons.add,
    AppIcons.GeneralHelpInHelpScreen : CupertinoIcons.info,

    AppIcons.RussianAlphabetSection : CupertinoIcons.textformat_size,
    AppIcons.NumbersSection : CupertinoIcons.textformat_123,
    AppIcons.PunctuationSymbolsSection : CupertinoIcons.exclamationmark,
    AppIcons.ArithmeticSymbolsSection : CupertinoIcons.plus_slash_minus,
    AppIcons.SignsSection : CupertinoIcons.square_grid_2x2,

  };

  static IconData getIcon(AppIcons type)
  {
    return AppIconsMap[type];
  }

}

