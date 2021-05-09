import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/shared/non_swipeable.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/components/settings_position_widget.dart';

@immutable
class SettingsScreen extends NavigationScreen {
  const SettingsScreen({
    Key key,
    Widget helpPage,
    Widget previousPage,
  }) : super(key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    return nonSwipeable(
      context,
      CupertinoPageScaffold(
        navigationBar: NavigationBar(
          currentPage: this,
          title: ScreenNames.getName(ScreenType.Settings),
        ),
        child: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: ScreenParams.height(4, context),
              ),
              Column(
                children: [
                  Container(
                    height: ScreenParams.heightIOS14(90, context),
                    child: ListView(
                      children: <Widget>[
                        for (var settingPosition in AppModel.settingsPositions)
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 2),
                            child: SettingsPosition(
                              settingPosition: settingPosition,
                            ),
                          ),
                        SizedBox(
                          height: 30,
                        ),
                        AboutButton(),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
