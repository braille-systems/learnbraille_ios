import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/components/help_widgets.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  final bool isBottomBarDisplayed = false;
  const HelpScreen({
    Key key,
    @required this.helpWidget,
    @required this.previousPage,
  }) : super(key: key);

  final Widget helpWidget;
  final Widget previousPage;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: NavigationBar(
        previousPage: previousPage,
        title: "Справка",
        showHelp: false, helpPage: null,
      ),
      child: SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            child: Column(children: [
              SizedBox(height: 5,),
              helpWidget,
              GeneralHelp(),
            ]),
          ),
        )),
      ),
    );
  }
}
