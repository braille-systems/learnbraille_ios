import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/components/bottom_bar_widget.dart';
import 'package:flutter_tutorial/components/menu_button_widget.dart';
import 'package:flutter_tutorial/models/app_model.dart';
import 'package:flutter_tutorial/models/menu_button.dart';
import 'package:flutter_tutorial/shared/screen_params.dart';



class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric( horizontal:20,),
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
            SizedBox(
              height: ScreenParams.height(70, context),
              child: GridView.count(
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
                    ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(menuButton: AppModel.menuButton),
    );
  }
}
