import 'dart:async';


import 'package:flutter/cupertino.dart';

import 'bottom_bar_widget.dart';

class NavigationBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const NavigationBar({
    Key key,
    @required this.title,
    @required this.previousPage,
  }) : super(key: key);

  final String title;
  final Widget previousPage;

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      padding: EdgeInsetsDirectional.only(start: 0),
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      leading: CupertinoNavigationBarBackButton(
        onPressed: () {
          Timer(Duration(milliseconds: 50), () {
            scakey.currentState.displayTapBar(true);
          });
          print(previousPage);
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => previousPage));
        },
      ),
      middle: Text(
        title,
        style: TextStyle(color: CupertinoColors.black, fontSize: 20),
      ),
      trailing: CupertinoButton(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Icon(CupertinoIcons.question_circle, size: 35),
        onPressed: () {},
      ),
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
