import 'dart:async';

import 'package:braille_abc/screens/help_screen.dart';
import 'package:flutter/cupertino.dart';

import 'bottom_bar_widget.dart';

class NavigationBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const NavigationBar({
    Key key,
    @required this.title,
    @required this.previousPage,
    @required this.helpPage,
    this.showHelp =  true,
    this.isNavigationScreen = false,
  }) : super(key: key);

  final String title;
  final Widget previousPage;
  final Widget helpPage;
  final bool showHelp;
  final bool isNavigationScreen;

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      padding: EdgeInsetsDirectional.only(start: 0),
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      leading: CupertinoNavigationBarBackButton(
        onPressed: () {
          if (isNavigationScreen) {
            scakey.currentState.onItemTapped(0);
          } else {
            Timer(Duration(milliseconds: 50), () {
              scakey.currentState.displayTapBar(true);
            });
            Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => previousPage));
          }
        },
      ),
      middle: Text(
        title,
        style: TextStyle(color: CupertinoColors.black, fontSize: 20),
      ),
      trailing: this.showHelp == true?
         CupertinoButton(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Icon(CupertinoIcons.question_circle, size: 35),
          onPressed: () {
            Timer(Duration(milliseconds: 10), () {
              scakey.currentState.displayTapBar(false);
            });
            Navigator.push(
                context, CupertinoPageRoute(
                builder: (context) => HelpScreen(helpWidget: helpPage)));
          },
        ):null
        ,
    );
  }

  @override
  // TODO: убрать это магическое число мб

  Size get preferredSize {
    return new Size.fromHeight(20.0);
  }

  @override
  // (From documentation)
  // If true, this widget fully obstructs widgets behind it by the specified size.
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}
