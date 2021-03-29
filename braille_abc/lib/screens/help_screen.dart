import 'package:braille_abc/components/help_widgets.dart';
import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/models/app_names.dart';

@immutable
class HelpScreen extends Screen {
  const HelpScreen({
    Key key,
    Screen previousPage,
    this.currentHelp,
  }) : super(key: key, hasNavigationBar: false, helpPage: null, previousPage: previousPage);

  final Widget currentHelp;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: NavigationBar(
        currentPage: this,
        title: ScreenNames.getName(ScreenType.Help),
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
        ),
      ),
    );
  }
}
