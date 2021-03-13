import 'package:braille_abc/components/help_widgets.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
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
        helpPage: null,
      ),
      child: SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(children: [
              SizedBox(
                height: 5,
              ),
              helpWidget,
              GeneralHelp(),
            ]),
          ),
        )),
      ),
    );
  }
}
