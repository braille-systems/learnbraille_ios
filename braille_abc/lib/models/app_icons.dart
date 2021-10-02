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
  GoBackButton,
  ChangeModeButton,
  HintButton,
  NextStep,
  TipButton,

  RussianAlphabetSection,
  NumbersSection,
  PunctuationSymbolsSection,
  ArithmeticSymbolsSection,
  SignsSection,

  Add,
  GeneralHelpInHelpScreen,
  StepHelp,

  EnableLessonSection,
  DisableLessonSection,

  About,
  Privacy,
}

@immutable
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
    AppIcons.GoBackButton : CupertinoIcons.chevron_left_2,
    AppIcons.ChangeModeButton : CupertinoIcons.arrow_right_arrow_left,
    AppIcons.HintButton : CupertinoIcons.quote_bubble_fill,
    AppIcons.NextStep : CupertinoIcons.arrow_right,
    AppIcons.TipButton : CupertinoIcons.lightbulb,

    AppIcons.Add : CupertinoIcons.add,
    AppIcons.GeneralHelpInHelpScreen : CupertinoIcons.info,
    AppIcons.StepHelp : CupertinoIcons.circle,

    AppIcons.RussianAlphabetSection : CupertinoIcons.textformat_size,
    AppIcons.NumbersSection : CupertinoIcons.textformat_123,
    AppIcons.PunctuationSymbolsSection : CupertinoIcons.exclamationmark,
    AppIcons.ArithmeticSymbolsSection : CupertinoIcons.plus_slash_minus,
    AppIcons.SignsSection : CupertinoIcons.square_grid_2x2,

    AppIcons.EnableLessonSection : CupertinoIcons.check_mark_circled,
    AppIcons.DisableLessonSection : CupertinoIcons.lock_fill,

    AppIcons.About : CupertinoIcons.info,
    AppIcons.Privacy : CupertinoIcons.book_circle
  };

  static IconData getIcon(AppIcons type)
  {
    return AppIconsMap[type];
  }

}

