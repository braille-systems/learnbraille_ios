import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:braille_abc/screens/help_screen.dart';
import 'package:flutter/cupertino.dart';
import 'bottom_bar_widget.dart';
import 'package:braille_abc/models/enums_model.dart';

class NavigationBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  const NavigationBar({
    Key key,
    @required this.title,
    this.currentPage,
  }) : super(key: key);

  final String title;
  final Screen currentPage;

  //bool displayBottomBar(Widget screen) => AppModel.navigationScreens.toString().contains(screen.toString());

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      leading: Semantics(
        label: StringOfSemanticsMap[SemanticsType.Back],
        child: CupertinoNavigationBarBackButton(
          onPressed: () {
            if (currentPage.hasNavigationBar) {
              scakey.currentState.onItemTapped(0);
            } else {
              if (currentPage.previousPage.hasNavigationBar) {
                Timer(Duration(milliseconds: 10), () {
                  scakey.currentState.displayTapBar(true);
                });
              }
              Navigator.push(context, CupertinoPageRoute(builder: (context) => currentPage.previousPage));
            }
          },
        ),
      ),
      middle: AutoSizeText(
        title,
        style: TextStyle(color: CupertinoColors.black, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      trailing: currentPage.helpPage != null
          ? CupertinoButton(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Icon(CupertinoIcons.question_circle, semanticLabel: StringOfScreensMap[ScreenType.Help], size: 35),
              onPressed: () {
                Timer(Duration(milliseconds: 10), () {
                  scakey.currentState.displayTapBar(false);
                });
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            HelpScreen(currentHelp: currentPage.helpPage, previousPage: currentPage)));
              },
            )
          : null,
    );
  }

  @override
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
