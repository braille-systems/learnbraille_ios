import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/help_model.dart';
import 'package:braille_abc/style.dart';
import 'package:braille_abc/components/expansion_section_widget.dart';
import 'package:braille_abc/models/screen_model.dart';


enum HelpSections {
  General,
  MainMenu,
  Practice,
  LetterPractice,
  Dictionary,
  LetterView,
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
        List<IconData> subIcon = [AppIcon.getIcon(AppIcons.BackButton), AppIcon.getIcon(AppIcons.HelpScreen)];
        return ExpansionSection(
            color: AppColors.first,
            sectionIcon: AppIcon.getIcon(AppIcons.GeneralHelpInHelpScreen),
            sectionName: HelpModel.helpSection[XmlNames.getName(XmlItemType.GeneralHelp)].name,
            child: buildHelp(subIcon, XmlNames.getName(XmlItemType.GeneralHelp)));

      case HelpSections.MainMenu:
        return buildHelp(null, XmlNames.getName(XmlItemType.MainMenu));

      case HelpSections.Practice:
        List<IconData> subIcon = [
          AppIcon.getIcon(AppIcons.ContinueButton),
        ];
        return buildHelp(subIcon, XmlNames.getName(XmlItemType.PracticeSections));

      case HelpSections.LetterPractice:
        List<IconData> subIcon = [
          AppIcon.getIcon(AppIcons.HintButton),
          AppIcon.getIcon(AppIcons.ChangeModeButton),
          AppIcon.getIcon(AppIcons.NextStep),
        ];
        return buildHelp(subIcon, ScreenNames.getName(ScreenType.Practice));

      case HelpSections.Dictionary:
        return buildHelp(null, XmlNames.getName(XmlItemType.Alphabet));

      case HelpSections.LetterView:
        List<IconData> subIcon = [
          AppIcon.getIcon(AppIcons.ChangeModeButton),
        ];
        return buildHelp(subIcon, XmlNames.getName(XmlItemType.SymbolView));
      default:
        return null;
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
}
