import 'package:braille_abc/models/help_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'expansion_section_widget.dart';

class MainMenuHelp extends StatelessWidget {
  static bool isNavigationDisplayed = true;

  const MainMenuHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Html(
        data: HelpModel.helpSection['Главное меню'].description,
        defaultTextStyle: TextStyle(fontSize: 17),
      ),
      for (int i = 0;
          i < HelpModel.helpSection['Главное меню'].content.length;
          i++)
        ExpansionSection(
          sectionIcon: CupertinoIcons.bars,
          sectionName: HelpModel.helpSection['Главное меню'].content[i].name,
          child: Html(
              data:
                  HelpModel.helpSection['Главное меню'].content[i].description,
              defaultTextStyle: TextStyle(fontSize: 17)),
        )
    ]);
  }
}

class GeneralHelp extends StatelessWidget {
  static bool isNavigationDisplayed = true;

  const GeneralHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionSection(
      color: Colors.orangeAccent,
      sectionIcon: CupertinoIcons.info,
      sectionName: HelpModel.helpSection['Общая справка'].name,
      child: Column(
        children: [
          Html(
            data: HelpModel.helpSection['Общая справка'].description,
            defaultTextStyle: TextStyle(fontSize: 17),
          ),
          for (int i = 0;
              i < HelpModel.helpSection['Общая справка'].content.length;
              i++)
            ExpansionSection(
              sectionIcon: CupertinoIcons.circle,
              sectionName:
                  HelpModel.helpSection['Общая справка'].content[i].name,
              child: Html(
                  data: HelpModel
                      .helpSection['Общая справка'].content[i].description,
                  defaultTextStyle: TextStyle(fontSize: 17)),
            )
        ],
      ),
    );
  }
}

class DictionaryHelp extends StatelessWidget {
  static bool isNavigationDisplayed = true;

  const DictionaryHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Html(
        data: HelpModel.helpSection['Алфавит'].description,
        defaultTextStyle: TextStyle(fontSize: 17),
      ),
      for (int i = 0; i < HelpModel.helpSection['Алфавит'].content.length; i++)
        ExpansionSection(
          sectionIcon: CupertinoIcons.textformat,
          sectionName: HelpModel.helpSection['Алфавит'].content[i].name,
          child: Html(
              data: HelpModel.helpSection['Алфавит'].content[i].description,
              defaultTextStyle: TextStyle(fontSize: 17)),
        )
    ]);
  }
}

class LetterViewHelp extends StatelessWidget {
  static bool isNavigationDisplayed = true;

  const LetterViewHelp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Html(
          data: HelpModel.helpSection['Просмотр символа'].description,
          defaultTextStyle: TextStyle(fontSize: 17),
        ),
        for (int i = 0;
            i < HelpModel.helpSection['Просмотр символа'].content.length;
            i++)
          ExpansionSection(
            color: Colors.orangeAccent,
            sectionIcon: CupertinoIcons.circle_grid_3x3_fill,
            sectionName:
                HelpModel.helpSection['Просмотр символа'].content[i].name,
            child: Column(
              children: [
                Html(
                  data: HelpModel
                      .helpSection['Просмотр символа'].content[i].description,
                  defaultTextStyle: TextStyle(fontSize: 17),
                ),
                for (int j = 0;
                    j <
                        HelpModel.helpSection['Просмотр символа'].content[i]
                            .content.length;
                    j++)
                  ExpansionSection(
                    sectionIcon: CupertinoIcons.circle,
                    sectionName: HelpModel.helpSection['Просмотр символа']
                        .content[i].content[j].name,
                    child: Html(
                        data: HelpModel.helpSection['Просмотр символа']
                            .content[i].content[i].description,
                        defaultTextStyle: TextStyle(fontSize: 17)),
                  )
              ],
            ),
          ),
      ],
    );
  }
}
