import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/help_model.dart';
import 'package:braille_abc/style.dart';
import 'package:braille_abc/components/expansion_section_widget.dart';
import 'package:braille_abc/models/screen_model.dart';

@immutable
class MainMenuHelp extends Screen {
  const MainMenuHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildHelp(null, XmlNames.getName(XmlItemType.MainMenu));
  }
}

@immutable
class GeneralHelp extends Screen {
  const GeneralHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> subIcon = [AppIcon.getIcon(AppIcons.BackButton), AppIcon.getIcon(AppIcons.HelpScreen)];
    return ExpansionSection(
        color: AppColors.first,
        sectionIcon: AppIcon.getIcon(AppIcons.GeneralHelpInHelpScreen),
        sectionName: HelpModel.helpSection[XmlNames.getName(XmlItemType.GeneralHelp)].name,
        child: buildHelp(subIcon, XmlNames.getName(XmlItemType.GeneralHelp)));
  }
}

@immutable
class LetterViewHelp extends Screen {
  const LetterViewHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> subIcon = [
      AppIcon.getIcon(AppIcons.ChangeModeButton),
    ];
    return buildHelp(subIcon, XmlNames.getName(XmlItemType.SymbolView));
  }
}

@immutable
class PracticeHelp extends Screen {
  const PracticeHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> subIcon = [
      AppIcon.getIcon(AppIcons.ContinueButton),
    ];
    return buildHelp(subIcon, XmlNames.getName(XmlItemType.PracticeSections));
  }
}

@immutable
class LetterPracticeHelp extends Screen {
  const LetterPracticeHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> subIcon = [
      AppIcon.getIcon(AppIcons.HintButton),
      AppIcon.getIcon(AppIcons.ChangeModeButton),
      AppIcon.getIcon(AppIcons.NextStep),
    ];
    return buildHelp(subIcon, ScreenNames.getName(ScreenType.Practice));
  }
}

@immutable
class DictionaryHelp extends Screen {
  const DictionaryHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildHelp(null, XmlNames.getName(XmlItemType.Alphabet));
  }
}

Column buildHelp(List<IconData> subIcon, String helpPage) {
  return Column(
    children: [
      Html(
        data: HelpModel.helpSection[helpPage].description,
        defaultTextStyle: Styles.helpTextStyle(),
      ),
      for (int i = 0; i < HelpModel.helpSection[helpPage].content.length; i++)
        ExpansionSection(
          color: AppColors.first,
          sectionIcon: AppIcon.getIcon(AppIcons.PracticeScreen),
          sectionName: HelpModel.helpSection[helpPage].content[i].name,
          child: Column(
            children: [
              Html(
                data: HelpModel.helpSection[helpPage].content[i].description,
                defaultTextStyle: Styles.helpTextStyle(),
              ),
              if (HelpModel.helpSection[helpPage].content[i].content != null)
                for (int j = 0; j < HelpModel.helpSection[helpPage].content[i].content.length; j++)
                  ExpansionSection(
                    sectionIcon: subIcon[j],
                    sectionName: HelpModel.helpSection[helpPage].content[i].content[j].name,
                    child: Html(
                        data: HelpModel.helpSection[helpPage].content[i].content[i].description,
                        defaultTextStyle: Styles.helpTextStyle()),
                  )
            ],
          ),
        ),
    ],
  );
}
