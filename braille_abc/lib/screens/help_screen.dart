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
             helpWidget,
              GeneralHelp(),
            ]),
          ),
        )),
      ),
    );
  }
}


