import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/components/expansion_section_widget.dart';
import 'package:braille_abc/components/help_widgets.dart';
import 'package:braille_abc/models/help_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({
    Key key,
    @required this.helpWidget,
  }) : super(key: key);

  final Widget helpWidget;

  @override
  Widget build(BuildContext context) {
    print(HelpModel.helpSection['Просмотр символа'].content.length);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            scakey.currentState.onItemTapped(0);
          },
        ),
        middle: Text(
          "Справка",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      child: SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Column(children: [

              Column(
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
                    sectionName: HelpModel.helpSection['Просмотр символа'].content[i].name,
                    child: Column(
                      children: [
                        Html(
                          data: HelpModel.helpSection['Просмотр символа'].content[i].description,
                          defaultTextStyle: TextStyle(fontSize: 17),
                        ),
                        for (int i = 0;
                            i <
                                HelpModel
                                    .helpSection['Просмотр символа'].content[i].content.length;
                            i++)
                          ExpansionSection(
                            sectionIcon: CupertinoIcons.circle,
                            sectionName: HelpModel
                                .helpSection['Просмотр символа'].content[i].content[i].name,
                            child: Html(
                                data: HelpModel.helpSection['Просмотр символа']
                                    .content[i].content[i].description,
                                defaultTextStyle: TextStyle(fontSize: 17)),
                          )
                      ],
                    ),
                  ),
                ],
              ),
              GeneralHelp(),
            ]),
          ),
        )),
      ),
    );
  }
}
