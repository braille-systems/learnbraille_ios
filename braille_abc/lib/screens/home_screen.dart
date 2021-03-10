import 'dart:io';
import 'dart:ui';
import 'package:xml/xml.dart';
import 'package:open_file/open_file.dart';
import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:braille_abc/components/menu_button_widget.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/menu_button.dart';
import 'package:braille_abc/shared/screen_params.dart';


import 'dart:async';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
  int currentIndex;
}

class _HomeScreen extends State<HomeScreen> {
  var _openResult = 'Unknown';

  Future<void> openFile() async {
    print("lol1");
    final filePath = './data/Help.xml';
    final result = await OpenFile.open(filePath);

    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
    print("lol");
    print(result.message);

  }

  @override
  void initState() {
    super.initState();
    openFile();
  }


  // ignore: missing_return

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
                    final file = new File('./data/Help.xml');
                    dynamic document = file.readAsString().then((value) {
                      XmlDocument.parse(value);
                    });
                    print(document);
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
