import 'dart:collection';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:braille_abc/models/help_model.dart';
import 'package:braille_abc/screens/test_screen.dart';
import 'package:xml/xml.dart';
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


  static String getHtml(Iterable<XmlNode> nodes){
    String result = "";
    for (var node in nodes) {
      result += node.toString();
    }
    print("description");
    print(result);
    return result;
  }


  static parseSect(XmlElement el){
    print(el.getAttribute('name'));
    return Section(
      el.getAttribute('name'),
      getHtml(el.findElements("text").first.nodes),
      parseButtonSections(el.findAllElements("button")),
    );
  }

  static parseButtonSections(Iterable<XmlElement> raw){
    print("parseButton");
    for(var el in raw){
      parseSect(el);
    }
  }

  static parseXml(String name, XmlDocument raw) {
    var sections = raw.findAllElements("section");
    print("parseSection");
    for (var el in sections) {
      AppModel.helpSection[el.getAttribute('name')] = parseSect(el);
    }
  }



  // ignore: missing_return
  static Future<List<Section>> getHelpFromXML(BuildContext context) async {
    String xmlString = await DefaultAssetBundle.of(context).loadString("data/Help.xml");
    // ignore: deprecated_member_use
    var raw = xml.parse(xmlString);
    parseXml("section", raw);
    /*var sections = raw.findAllElements("section");
    var listEl = sections.map((element) {
      print(element.getAttribute("name")); // name of the section
      var des = element.findElements("description").first.nodes;
      String fullDescription = "";
      for (var i in des) {
        fullDescription += i.toString();
      }
      var button = element.findAllElements("button");
      var buttonText;
      var buttonName;
      for (var el in button){
        buttonText = el.findElements("text").toString();
        buttonName = el.getAttribute("name");
      }
      var buttonList = button.map((butEl) {
        var text = butEl.findElements("text").first.nodes;
        String fullText = "";
        for (var t in text) {
          fullText += t.toString();
        }
      });
      String fullButton = "";
      for (var i in button) {
        fullButton += i.toString();
      }
      List<Section> s = [Section(buttonName, buttonText, null)];
      AppModel.helpSection[element.getAttribute("name")] = Section(
        element.getAttribute("name"),
        fullDescription,
        s,
      );
    }).toList();
    print(AppModel.helpSection['Главное меню'].sectionHelp[0].description);*/
    //return listEl;
  }

}

class _HomeScreen extends State<HomeScreen> {
  @override
  void initState() {
    HomeScreen.getHelpFromXML(context);
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
                        builder: (context) => TestScreen(),
                      ),
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
