import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/help_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../style.dart';
import 'expansion_section_widget.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/models/app_names.dart';

class MainMenuHelp extends Screen {
  const MainMenuHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Html(
        data: HelpModel.helpSection['Главное меню'].description,
        defaultTextStyle: Styles.helpTextStyle(),
      ),
      for (int i = 0; i < HelpModel.helpSection['Главное меню'].content.length; i++)
        ExpansionSection(
          sectionIcon: CupertinoIcons.bars,
          sectionName: HelpModel.helpSection['Главное меню'].content[i].name,
          child: Html(
              data: HelpModel.helpSection['Главное меню'].content[i].description,
              defaultTextStyle: Styles.helpTextStyle()),
        )
    ]);
  }
}

class GeneralHelp extends Screen {
  const GeneralHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> subIcon = [CupertinoIcons.back, CupertinoIcons.question_circle];
    return ExpansionSection(
      color: Colors.orangeAccent,
      sectionIcon: CupertinoIcons.info,
      sectionName: HelpModel.helpSection['Общая справка'].name,
      child: Column(
        children: [
          Html(
            data: HelpModel.helpSection['Общая справка'].description,
            defaultTextStyle: Styles.helpTextStyle(),
          ),
          for (int i = 0; i < HelpModel.helpSection['Общая справка'].content.length; i++)
            ExpansionSection(
              sectionIcon: subIcon[i],
              sectionName: HelpModel.helpSection['Общая справка'].content[i].name,
              child: Html(
                  data: HelpModel.helpSection['Общая справка'].content[i].description,
                  defaultTextStyle: Styles.helpTextStyle()),
            )
        ],
      ),
    );
  }
}

class DictionaryHelp extends Screen {
  const DictionaryHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Html(
        data: HelpModel.helpSection['Алфавит'].description,
        defaultTextStyle: Styles.helpTextStyle(),
      ),
      for (int i = 0; i < HelpModel.helpSection['Алфавит'].content.length; i++)
        ExpansionSection(
          sectionIcon: CupertinoIcons.textformat,
          sectionName: HelpModel.helpSection['Алфавит'].content[i].name,
          child: Html(
              data: HelpModel.helpSection['Алфавит'].content[i].description, defaultTextStyle: Styles.helpTextStyle()),
        )
    ]);
  }
}

class LetterViewHelp extends Screen {
  const LetterViewHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> subIcon = [
      CupertinoIcons.arrow_right_arrow_left,
    ];
    return Column(
      children: [
        Html(
          data: HelpModel.helpSection['Просмотр символа'].description,
          defaultTextStyle: Styles.helpTextStyle(),
        ),
        for (int i = 0; i < HelpModel.helpSection['Просмотр символа'].content.length; i++)
          ExpansionSection(
            color: Colors.orangeAccent,
            sectionIcon: CupertinoIcons.circle_grid_3x3_fill,
            sectionName: HelpModel.helpSection['Просмотр символа'].content[i].name,
            child: Column(
              children: [
                Html(
                  data: HelpModel.helpSection['Просмотр символа'].content[i].description,
                  defaultTextStyle: Styles.helpTextStyle(),
                ),
                for (int j = 0; j < HelpModel.helpSection['Просмотр символа'].content[i].content.length; j++)
                  ExpansionSection(
                    sectionIcon: subIcon[j],
                    sectionName: HelpModel.helpSection['Просмотр символа'].content[i].content[j].name,
                    child: Html(
                        data: HelpModel.helpSection['Просмотр символа'].content[i].content[i].description,
                        defaultTextStyle: Styles.helpTextStyle()),
                  )
              ],
            ),
          ),
      ],
    );
  }
}

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
            color: Colors.orangeAccent,
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
            color: Colors.orangeAccent,
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