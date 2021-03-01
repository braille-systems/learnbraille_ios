import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/components/body_widget.dart';
import 'package:flutter/cupertino.dart';

final scakey = new GlobalKey<_BottomState>();

class Bottom extends StatefulWidget {
  Bottom({Key key}) : super(key: key);

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  final myKey = new GlobalKey<_BottomState>();
  int _selectedIndex = 0;
  final CupertinoTabController _controller = CupertinoTabController();

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _controller.index = index;
      print(_selectedIndex);
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
      tabBar: CupertinoTabBar(
        onTap: onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: CupertinoColors.lightBackgroundGray,
            icon: Icon(CupertinoIcons.bars),
            label: 'Меню',
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
