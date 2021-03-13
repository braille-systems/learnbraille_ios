import 'dart:async';
import 'package:braille_abc/models/app_model.dart';
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
    this.currentPage,
  }) : super(key: key);

  final String title;
  final Widget previousPage;
  final Widget helpPage;
  final Widget currentPage;

  bool displayBottomBar(Widget screen) =>
      AppModel.screens.toString().contains(screen.toString());

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      leading: CupertinoNavigationBarBackButton(
        onPressed: () {
          if (displayBottomBar(currentPage)) {
            scakey.currentState.onItemTapped(0);
          } else {
            if (displayBottomBar(previousPage)) {
              Timer(Duration(milliseconds: 10), () {
                scakey.currentState.displayTapBar(true);
              });
            }
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => previousPage));
          }
        },
      ),
      middle: Text(
        title,
        style: TextStyle(
            color: CupertinoColors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
      trailing: this.helpPage != null
          ? CupertinoButton(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Icon(CupertinoIcons.question_circle, size: 35),
              onPressed: () {
                Timer(Duration(milliseconds: 10), () {
                  scakey.currentState.displayTapBar(false);
                });
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => HelpScreen(
                              helpWidget: helpPage,
                              previousPage: currentPage,
                            )));
              },
            )
          : null,
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
