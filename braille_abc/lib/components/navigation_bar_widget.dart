import 'package:flutter/cupertino.dart';
import 'package:braille_abc/models/app_model.dart';

class NavigationBar extends StatelessWidget implements ObstructingPreferredSizeWidget{
  const NavigationBar({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return  CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.only(start: 0),
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => AppModel.screens[1],
              ),
            );
          },
        ),
        middle: Text(title,
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
  Size get preferredSize
  {
    return new Size.fromHeight(20.0);
  }

  @override
  // (From documentation)
  // If true, this widget fully obstructs widgets behind it by the specified size.
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}