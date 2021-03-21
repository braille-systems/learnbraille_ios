import 'package:braille_abc/components/help_widgets.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpScreen extends Screen {
  const HelpScreen({
    Key key,
    this.previousPage,
    this.currentHelp,
  }) : super(key: key, hasNavigationBar: false, helpPage: null, previousPage: previousPage);
  final Widget currentHelp;
  final Widget previousPage;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: NavigationBar(
        previousPage: previousPage,
        title: "Справка",
        helpPage: null,
      ),
      child: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(children: [
            SizedBox(
              height: 5,
            ),
            currentHelp,
            GeneralHelp(),
          ]),
        ),
      )),
    );
  }
}
