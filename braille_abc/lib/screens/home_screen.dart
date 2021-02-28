import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:braille_abc/components/menu_button_widget.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/menu_button.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/components/body_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
  int currentIndex;
  setIndex(int index) {
    //_HomeScreen()._currentTabIndex = index;
    //_HomeScreen().setState(() {
      _HomeScreen().setIndex(index);
   // });
    //print("Set index:");
    //print(index);
  }
}

class _HomeScreen extends State<HomeScreen> {

  CupertinoTabController _tabController;

  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = CupertinoTabController();
  }

  void _toggleTab() {
    _tabIndex = _tabController.index + 1;
  }

  setIndex(int index){

    if(mounted) {
      setState(() {
        _tabIndex = index;
        print("Set index:");
        print(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _tabController,
      tabBar: CupertinoTabBar(
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

        currentIndex: TabData.current_index,
        onTap: (int) {
          setState(() {
            _tabIndex = int;
            TabData.current_index=int;
            print("New index:");
            print(AppModel.screens[int]);
            print(int);
          });
        },
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
            builder: (context) {
          return CupertinoPageScaffold(
            child: Body(index),
          );
        });
      },
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        minimum: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        //padding: const EdgeInsets.symmetric(horizontal: 20,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenParams.height(6, context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Меню",
                  style: TextStyle(
                      color: CupertinoColors.black,
                      fontSize: 55,
                      fontWeight: FontWeight.bold),
                ),
                CupertinoButton(
                  child: Icon(
                    CupertinoIcons.question_circle,
                    size: ScreenParams.height(5, context),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: ScreenParams.height(5, context)),
            Container(
              height: ScreenParams.heightIOS14(65, context),
              child: GridView.count(
                physics: new NeverScrollableScrollPhysics(),
                childAspectRatio: (50 / 65),
                mainAxisSpacing: ScreenParams.height(3, context),
                crossAxisSpacing: ScreenParams.height(2, context),
                crossAxisCount: 2,
                children: <Widget>[
                  for (int i = 0; i < AppModel.menuButton.length; i++)
                    MenuButtonWidget(
                      menuButton: MenuButton(
                          name: AppModel.menuButton[i].name,
                          icon: AppModel.menuButton[i].icon),
                          index: i+1,
                          homeScreen: HomeScreen(),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
