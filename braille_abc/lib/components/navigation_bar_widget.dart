import 'dart:async';

import 'package:braille_abc/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/screens/help_screen.dart';
import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/screen_model.dart';

@immutable
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
      backgroundColor: AppColors.navigationBar,
      leading: Semantics(
        label: SemanticNames.getName(SemanticsType.Back),
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
        style: TextStyle(color: AppColors.navigationBarText, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      trailing: currentPage.helpPage != null
          ? CupertinoButton(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
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
        child: Icon(AppIcon.getIcon(AppIcons.HelpScreen), semanticLabel: ScreenNames.getName(ScreenType.Help), size: 35),
      )
          : null,
    );
  }

  @override
  Size get preferredSize {
    return  Size.fromHeight(20.0);
  }

  @override
  // (From documentation)
  // If true, this widget fully obstructs widgets behind it by the specified size.
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}
