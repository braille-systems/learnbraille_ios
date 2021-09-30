import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/help_model.dart';
import 'package:braille_abc/style.dart';
import 'package:braille_abc/components/expansion_section_widget.dart';
import 'package:braille_abc/models/screen_model.dart';

import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

enum HelpSections {
  General,
  MainMenu,
  Practice,
  LetterPractice,
  Dictionary,
  LetterView,
  PracticeResult,
  ReadingLessonScreen,
  TextLessonScreen,
  PracticeLessonScreen,
  StudyScreen,
  AboutScreen,
  SettingsScreen,
  EndLessonsScreen,
  EndStudyScreen,
}

@immutable
class Help extends Screen {
  const Help({
    Key key,
    @required this.helpName,
  }) : super(key: key);

  final HelpSections helpName;

  @override
  Widget build(BuildContext context) {
    switch (helpName) {
      case HelpSections.General:
        List<IconData> subIcon = [
          AppIcon.getIcon(AppIcons.BackButton),
          AppIcon.getIcon(AppIcons.HelpScreen)
        ];
        return ExpansionSection(
            color: AppColors.first,
            sectionIcon: AppIcon.getIcon(AppIcons.GeneralHelpInHelpScreen),
            sectionName: HelpModel
                .helpSection[XmlNames.getName(XmlItemType.GeneralHelp)].name,
            child:
                buildHelp(subIcon, XmlNames.getName(XmlItemType.GeneralHelp)));

      case HelpSections.MainMenu:
        List<IconData> subIcon = [
          AppIcon.getIcon(AppIcons.MenuScreen),
          AppIcon.getIcon(AppIcons.Privacy),
        ];
        if(!Platform.isIOS) {
          subIcon.removeLast(); // hide privacy link for other platforms
        }
        return buildHelp(subIcon, XmlNames.getName(XmlItemType.MainMenu));

      case HelpSections.Practice:
        List<IconData> subIcon = [
          AppIcon.getIcon(AppIcons.PracticeScreen),
          AppIcon.getIcon(AppIcons.ContinueButton),
        ];
        return buildHelp(
            subIcon, XmlNames.getName(XmlItemType.PracticeSections));

      case HelpSections.LetterPractice:
        List<IconData> subIcon = [
          AppIcon.getIcon(AppIcons.PracticeScreen),
          AppIcon.getIcon(AppIcons.TipButton),
          AppIcon.getIcon(AppIcons.ChangeModeButton),
          AppIcon.getIcon(AppIcons.NextStep),
        ];
        return buildHelp(subIcon, ScreenNames.getName(ScreenType.Practice));

      case HelpSections.Dictionary:
        List<IconData> subIcon = [
          AppIcon.getIcon(AppIcons.DictionaryScreen),
        ];
        return buildHelp(subIcon, XmlNames.getName(XmlItemType.Alphabet));

      case HelpSections.LetterView:
        List<IconData> subIcon = [
          AppIcon.getIcon(AppIcons.DictionaryScreen),
          AppIcon.getIcon(AppIcons.ChangeModeButton),
        ];
        return buildHelp(subIcon, XmlNames.getName(XmlItemType.SymbolView));

      case HelpSections.PracticeResult:
        List<IconData> subIcon = [
          AppIcon.getIcon(AppIcons.PracticeScreen),
          AppIcon.getIcon(AppIcons.BackButton),
        ];
        return buildHelp(subIcon, XmlNames.getName(XmlItemType.PracticeResult));

      case HelpSections.StudyScreen:
        List<IconData> subIcon = [
          AppIcon.getIcon(AppIcons.StudyScreen),
          AppIcon.getIcon(AppIcons.BackButton),
        ];
        return buildHelp(subIcon, XmlNames.getName(XmlItemType.StudyScreen));

      case HelpSections.TextLessonScreen:
        List<IconData> subIcon = [
          AppIcon.getIcon(AppIcons.StepHelp),
          AppIcon.getIcon(AppIcons.GoBackButton),
          AppIcon.getIcon(AppIcons.ContinueButton),
        ];
        return buildHelp(
            subIcon, XmlNames.getName(XmlItemType.TextLessonScreen));

      case HelpSections.PracticeLessonScreen:
        List<IconData> subIcon = [
          AppIcon.getIcon(AppIcons.StepHelp),
          AppIcon.getIcon(AppIcons.ChangeModeButton),
          AppIcon.getIcon(AppIcons.GoBackButton),
          AppIcon.getIcon(AppIcons.TipButton),
          AppIcon.getIcon(AppIcons.ContinueButton),
        ];
        return buildHelp(
            subIcon, XmlNames.getName(XmlItemType.PracticeLessonScreen));

      case HelpSections.ReadingLessonScreen:
        List<IconData> subIcon = [
          AppIcon.getIcon(AppIcons.StepHelp),
          AppIcon.getIcon(AppIcons.ChangeModeButton),
          AppIcon.getIcon(AppIcons.GoBackButton),
          AppIcon.getIcon(AppIcons.ContinueButton),
        ];
        return buildHelp(
            subIcon, XmlNames.getName(XmlItemType.ReadingLessonScreen));

      case HelpSections.AboutScreen:
        return buildHelp(null, XmlNames.getName(XmlItemType.About));

      case HelpSections.SettingsScreen:
        List<IconData> subIcon = [
          AppIcon.getIcon(AppIcons.SettingsScreen),
          AppIcon.getIcon(AppIcons.About),
        ];
        return buildHelp(subIcon, XmlNames.getName(XmlItemType.Settings));

      case HelpSections.EndLessonsScreen:
        List<IconData> subIcon = [
          AppIcon.getIcon(AppIcons.StepHelp),
          AppIcon.getIcon(AppIcons.GoBackButton),
          AppIcon.getIcon(AppIcons.ContinueButton),
          AppIcon.getIcon(AppIcons.ContinueButton),
        ];
        return buildHelp(subIcon, XmlNames.getName(XmlItemType.EndLesson));

      default:
        return null;
    }
  }

  Column buildHelp(List<IconData> subIcon, String helpPage,
      {bool general = false}) {
    return Column(
      children: [
        Html(
          data: HelpModel.helpSection[helpPage].description,
          defaultTextStyle: Styles.helpTextStyle(),
        ),
        for (int i = 0; i < subIcon.length; i++)
          ExpansionSection(
            color: AppColors.first,
            sectionIcon: subIcon[i],
            sectionName: HelpModel.helpSection[helpPage].content[i].name,
            child: Column(
              children: [
                Html(
                  data: HelpModel.helpSection[helpPage].content[i].description,
                  defaultTextStyle: Styles.helpTextStyle(),
                  onLinkTap: (url) async {
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                if (HelpModel.helpSection[helpPage].content[i].content != null)
                  for (int j = 0;
                      j <
                          HelpModel
                              .helpSection[helpPage].content[i].content.length;
                      j++)
                    ExpansionSection(
                      sectionIcon: subIcon[i + j + 1],
                      sectionName: HelpModel
                          .helpSection[helpPage].content[i].content[j].name,
                      child: Html(
                          data: HelpModel.helpSection[helpPage].content[i]
                              .content[j].description,
                          defaultTextStyle: Styles.helpTextStyle()),
                    )
              ],
            ),
          ),
      ],
    );
  }
}
