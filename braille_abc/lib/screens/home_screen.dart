import 'dart:ui';
import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/help_model.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/models/study_model.dart';
import 'package:braille_abc/screens/help_screen.dart';
import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/shared/non_swipeable.dart';
import 'package:braille_abc/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/components/menu_button_widget.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/menu_button.dart';
import 'package:braille_abc/shared/screen_params.dart';

@immutable
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    HelpModel.fillHelpModel(context);
    StudyModel.fillStudyModel(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Bottom(key: scakey),
    );
  }
}

class MenuScreen extends NavigationScreen {
  const MenuScreen({
    Key key,
    Widget helpPage,
    Widget previousPage,
  }) : super(key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    return nonSwipeable(
      context,
      CupertinoPageScaffold(
        child: SafeArea(
          minimum: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenParams.height(4, context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ScreenNames.getName(ScreenType.Home),
                    style: TextStyle(
                        color: AppColors.navigationBarText,
                        fontSize: 55,
                        fontWeight: FontWeight.bold),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      scakey.currentState.displayTapBar(false);
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                            builder: (context) => HelpScreen(
                                  currentHelp: helpPage,
                                  previousPage: this,
                                )),
                      );
                    },
                    child: Icon(
                      AppIcon.getIcon(AppIcons.HelpScreen),
                      semanticLabel: ScreenNames.getName(ScreenType.Help),
                      size: ScreenParams.height(5, context),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenParams.height(4, context)),
              Container(
                height: ScreenParams.heightIOS14(80, context),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  childAspectRatio: (4.0 / 5.0),
                  mainAxisSpacing: ScreenParams.height(3, context),
                  crossAxisSpacing: ScreenParams.height(2, context),
                  crossAxisCount: 2,
                  children: <Widget>[
                    for (int i = 0; i < AppModel.menuButton.length; i++)
                      MenuButtonWidget(
                        menuButton: MenuButton(
                            name: AppModel.menuButton[i].name,
                            icon: AppModel.menuButton[i].icon),
                        index: i + 1,
                        homeScreen: HomeScreen(),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
