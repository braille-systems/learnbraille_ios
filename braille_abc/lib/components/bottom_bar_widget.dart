import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/components/body_widget.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:flutter/cupertino.dart';

final scakey =  GlobalKey<_BottomState>();

class Bottom extends StatefulWidget {
  Bottom({Key key}) : super(key: key);

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  final myKey =  GlobalKey<_BottomState>();
  bool _disableTapBar = false;
  final CupertinoTabController _controller = CupertinoTabController();

  void onItemTapped(int index) {
    setState(() {
      _controller.index = index;
    });
  }

  void displayTapBar(bool isDisplayed) {
    setState(() {
      _disableTapBar = !isDisplayed;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _controller,
      key: myKey,
      tabBar: _disableTapBar
          ? InvisibleCupertinoTabBar()
          : CupertinoTabBar(
              onTap: onItemTapped,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: CupertinoColors.lightBackgroundGray,
                  icon: Icon(AppIcon.getIcon(AppIcons.MenuScreen)),
                  label: ScreenNames.getName(ScreenType.Home),
                ),
                for (int i = 0; i < AppModel.menuButton.length; i++)
                  BottomNavigationBarItem(
                    backgroundColor: CupertinoColors.lightBackgroundGray,
                    icon: Icon(AppModel.menuButton[i].icon),
                    label: AppModel.menuButton[i].name,
                  ),
              ],
            ),
      tabBuilder: (context, index) {
        return CupertinoTabView(builder: (context) {
          return CupertinoPageScaffold(
            child: Body(index),
          );
        });
      },
    );
  }
}

class InvisibleCupertinoTabBar extends CupertinoTabBar {
  static const dummyIcon = Icon(IconData(0x0020));

  InvisibleCupertinoTabBar()
      : super(
          items: [
            BottomNavigationBarItem(icon: dummyIcon),
            BottomNavigationBarItem(icon: dummyIcon),
            BottomNavigationBarItem(icon: dummyIcon),
            BottomNavigationBarItem(icon: dummyIcon),
            BottomNavigationBarItem(icon: dummyIcon),
          ],
        );

  @override
  Size get preferredSize => const Size.square(0);

  @override
  Widget build(BuildContext context) => SizedBox();

  @override
  InvisibleCupertinoTabBar copyWith({
    Key key,
    List<BottomNavigationBarItem> items,
    Color backgroundColor,
    Color activeColor,
    Color inactiveColor,
    double iconSize,
    Border border,
    int currentIndex,
    ValueChanged<int> onTap,
  }) =>
      InvisibleCupertinoTabBar();
}
