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
    return Column(children: [
      Html(
        data: HelpModel.helpSection[XmlNames.getName(XmlItemType.MainMenu)].description,
        defaultTextStyle: Styles.helpTextStyle(),
      ),
      for (int i = 0; i < HelpModel.helpSection[XmlNames.getName(XmlItemType.MainMenu)].content.length; i++)
        ExpansionSection(
          sectionIcon: AppIcon.getIcon(AppIcons.MenuScreen),
          sectionName: HelpModel.helpSection[XmlNames.getName(XmlItemType.MainMenu)].content[i].name,
          child: Html(
              data: HelpModel.helpSection[XmlNames.getName(XmlItemType.MainMenu)].content[i].description,
              defaultTextStyle: Styles.helpTextStyle()),
        )
    ]);
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
      child: Column(
        children: [
          Html(
            data: HelpModel.helpSection[XmlNames.getName(XmlItemType.GeneralHelp)].description,
            defaultTextStyle: Styles.helpTextStyle(),
          ),
          for (int i = 0; i < HelpModel.helpSection[XmlNames.getName(XmlItemType.GeneralHelp)].content.length; i++)
            ExpansionSection(
              sectionIcon: subIcon[i],
              sectionName: HelpModel.helpSection[XmlNames.getName(XmlItemType.GeneralHelp)].content[i].name,
              child: Html(
                  data: HelpModel.helpSection[XmlNames.getName(XmlItemType.GeneralHelp)].content[i].description,
                  defaultTextStyle: Styles.helpTextStyle()),
            )
        ],
      ),
    );
  }
}

@immutable
class DictionaryHelp extends Screen {
  const DictionaryHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Html(
        data: HelpModel.helpSection[XmlNames.getName(XmlItemType.Alphabet)].description,
        defaultTextStyle: Styles.helpTextStyle(),
      ),
      for (int i = 0; i < HelpModel.helpSection[XmlNames.getName(XmlItemType.Alphabet)].content.length; i++)
        ExpansionSection(
          sectionIcon: AppIcon.getIcon(AppIcons.DictionaryScreen),
          sectionName: HelpModel.helpSection[XmlNames.getName(XmlItemType.Alphabet)].content[i].name,
          child: Html(
              data: HelpModel.helpSection[XmlNames.getName(XmlItemType.Alphabet)].content[i].description,
              defaultTextStyle: Styles.helpTextStyle()),
        )
    ]);
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
    return Column(
      children: [
        Html(
          data: HelpModel.helpSection[XmlNames.getName(XmlItemType.SymbolView)].description,
          defaultTextStyle: Styles.helpTextStyle(),
        ),
        for (int i = 0; i < HelpModel.helpSection[XmlNames.getName(XmlItemType.SymbolView)].content.length; i++)
          ExpansionSection(
            color: AppColors.first,
            sectionIcon: AppIcon.getIcon(AppIcons.DictionaryScreen),
            sectionName: HelpModel.helpSection[XmlNames.getName(XmlItemType.SymbolView)].content[i].name,
            child: Column(
              children: [
                Html(
                  data: HelpModel.helpSection[XmlNames.getName(XmlItemType.SymbolView)].content[i].description,
                  defaultTextStyle: Styles.helpTextStyle(),
                ),
                for (int j = 0;
                    j < HelpModel.helpSection[XmlNames.getName(XmlItemType.SymbolView)].content[i].content.length;
                    j++)
                  ExpansionSection(
                    sectionIcon: subIcon[j],
                    sectionName:
                        HelpModel.helpSection[XmlNames.getName(XmlItemType.SymbolView)].content[i].content[j].name,
                    child: Html(
                        data: HelpModel
                            .helpSection[XmlNames.getName(XmlItemType.SymbolView)].content[i].content[i].description,
                        defaultTextStyle: Styles.helpTextStyle()),
                  )
              ],
            ),
          ),
      ],
    );
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
    return Column(
      children: [
        Html(
          data: HelpModel.helpSection[XmlNames.getName(XmlItemType.PracticeSections)].description,
          defaultTextStyle: Styles.helpTextStyle(),
        ),
        for (int i = 0; i < HelpModel.helpSection[XmlNames.getName(XmlItemType.PracticeSections)].content.length; i++)
          ExpansionSection(
            color: AppColors.first,
            sectionIcon: AppIcon.getIcon(AppIcons.PracticeScreen),
            sectionName: HelpModel.helpSection[XmlNames.getName(XmlItemType.PracticeSections)].content[i].name,
            child: Column(
              children: [
                Html(
                  data: HelpModel.helpSection[XmlNames.getName(XmlItemType.PracticeSections)].content[i].description,
                  defaultTextStyle: Styles.helpTextStyle(),
                ),
                for (int j = 0; j < HelpModel.helpSection[XmlNames.getName(XmlItemType.PracticeSections)].content[i].content.length; j++)
                  ExpansionSection(
                    sectionIcon: subIcon[j],
                    sectionName: HelpModel.helpSection[XmlNames.getName(XmlItemType.PracticeSections)].content[i].content[j].name,
                    child: Html(
                        data: HelpModel.helpSection[XmlNames.getName(XmlItemType.PracticeSections)].content[i].content[i].description,
                        defaultTextStyle: Styles.helpTextStyle()),
                  )
              ],
            ),
          ),
      ],
    );
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
    return Column(
      children: [
        Html(
          data: HelpModel.helpSection[ScreenNames.getName(ScreenType.Practice)].description,
          defaultTextStyle: Styles.helpTextStyle(),
        ),
        for (int i = 0; i < HelpModel.helpSection[ScreenNames.getName(ScreenType.Practice)].content.length; i++)
          ExpansionSection(
            color: AppColors.first,
            sectionIcon: AppIcon.getIcon(AppIcons.PracticeScreen),
            sectionName: HelpModel.helpSection[ScreenNames.getName(ScreenType.Practice)].content[i].name,
            child: Column(
              children: [
                Html(
                  data: HelpModel.helpSection[ScreenNames.getName(ScreenType.Practice)].content[i].description,
                  defaultTextStyle: Styles.helpTextStyle(),
                ),
                for (int j = 0; j < HelpModel.helpSection[ScreenNames.getName(ScreenType.Practice)].content[i].content.length; j++)
                  ExpansionSection(
                    sectionIcon: subIcon[j],
                    sectionName: HelpModel.helpSection[ScreenNames.getName(ScreenType.Practice)].content[i].content[j].name,
                    child: Html(
                        data: HelpModel.helpSection[ScreenNames.getName(ScreenType.Practice)].content[i].content[i].description,
                        defaultTextStyle: Styles.helpTextStyle()),
                  )
              ],
            ),
          ),
      ],
    );
  }
}