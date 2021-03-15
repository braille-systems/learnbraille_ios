import 'package:braille_abc/models/help_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../style.dart';
import 'expansion_section_widget.dart';

class MainMenuHelp extends StatelessWidget {
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
              defaultTextStyle:Styles.helpTextStyle()),
        )
    ]);
  }
}

class GeneralHelp extends StatelessWidget {
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
                  defaultTextStyle:Styles.helpTextStyle()),
            )
        ],
      ),
    );
  }
}

class DictionaryHelp extends StatelessWidget {
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

class LetterViewHelp extends StatelessWidget {
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
