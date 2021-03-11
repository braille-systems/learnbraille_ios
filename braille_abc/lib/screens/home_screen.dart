import 'dart:io';
import 'dart:ui';
import 'package:braille_abc/models/help_model.dart';
import 'package:braille_abc/screens/test_screen.dart';
import 'package:xml/xml.dart';
import 'package:open_file/open_file.dart';
import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/components/menu_button_widget.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/menu_button.dart';
import 'package:braille_abc/shared/screen_params.dart';

import 'package:xml/xml.dart' as xml;
import 'dart:async';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
  int currentIndex;

  static Future<List<Contact>> getContactsFromXML(BuildContext context) async {
    String xmlString =
    await DefaultAssetBundle.of(context).loadString("data/contacts.xml");
    var raw = xml.parse(xmlString);
    var elements = raw.findAllElements("contact");

    var listEl = elements.map((element) {
      return Contact(
          element.findElements("name").first.text,
          element.findElements("email").first.text,
          int.parse(element.findElements("age").first.text));
    }).toList();
    return listEl;
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Bottom(key: scakey),
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
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
                  onPressed: () {
                    scakey.currentState.displayTapBar(false);
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => TestScreen(),                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: ScreenParams.height(4, context)),
            Container(
              height: ScreenParams.heightIOS14(70, context),
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
                      index: i + 1,
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
