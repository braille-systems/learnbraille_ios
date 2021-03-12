import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/components/expansion_section_widget.dart';
import 'package:braille_abc/models/help_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: Column(children: [
            ExpansionSection(
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
                      sectionName: HelpModel
                          .helpSection['Общая справка'].content[i].name,
                      child: Html(
                          data: HelpModel.helpSection['Общая справка']
                              .content[i].description,
                          defaultTextStyle: TextStyle(fontSize: 17)),
                    )
                ],
              ),
            ),
          ]),
        )),
      ),
    );
  }
}
