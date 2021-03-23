import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/help_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../style.dart';
import 'expansion_section_widget.dart';
import 'package:braille_abc/models/screen_model.dart';

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
          sectionIcon: CupertinoIcons.bars,
          sectionName: HelpModel.helpSection[XmlNames.getName(XmlItemType.MainMenu)].content[i].name,
          child: Html(
              data: HelpModel.helpSection[XmlNames.getName(XmlItemType.MainMenu)].content[i].description,
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
          sectionIcon: CupertinoIcons.textformat,
          sectionName: HelpModel.helpSection[XmlNames.getName(XmlItemType.Alphabet)].content[i].name,
          child: Html(
              data: HelpModel.helpSection[XmlNames.getName(XmlItemType.Alphabet)].content[i].description,
              defaultTextStyle: Styles.helpTextStyle()),
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
          data: HelpModel.helpSection[XmlNames.getName(XmlItemType.SymbolView)].description,
          defaultTextStyle: Styles.helpTextStyle(),
        ),
        for (int i = 0; i < HelpModel.helpSection[XmlNames.getName(XmlItemType.SymbolView)].content.length; i++)
          ExpansionSection(
            color: Colors.orangeAccent,
            sectionIcon: CupertinoIcons.circle_grid_3x3_fill,
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
