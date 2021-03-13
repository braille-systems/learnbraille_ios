import 'package:braille_abc/components/bottom_bar_widget.dart';
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
            body: Column(children: [
              Html(
                data: HelpModel
                    .helpSection['Просмотр символа'].content[0].description,
                defaultTextStyle: TextStyle(
                  fontSize: 20,
                ),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              ),
        ])),
      ),
    );
  }
}
