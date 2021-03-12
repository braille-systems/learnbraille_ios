import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/help_model.dart';
import 'package:braille_abc/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(AppModel.helpSection['Главное меню'].description);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          onPressed: () {
            scakey.currentState.onItemTapped(0);
          },
        ),
        middle: Text(
          "Test",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(CupertinoIcons.ear),
      ),
      child: SafeArea(
        child: Scaffold(
            body: Column(children: [
              Html(data: AppModel.helpSection['Главное меню'].description),
              //Html(data:"<p>Вы находитесь в разделе <b>главного меню</b> приложения по обучению шрифту Брайля.</p><p>Дополнительную информацию по разделу или по использованию приложения в целом можно узнать, выбрав соответсвующий пункт из меню ниже.</p>"),
              Expanded(
                child: FutureBuilder(
                  future: HomeScreen.getHelpFromXML(context),
                  builder: (context, data) {
                    if (data.hasData) {
                      List<Section> contacts = data.data;
                      return ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Html(data: contacts[index].description, defaultTextStyle: TextStyle(fontSize: 20),),);
                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              )
        ])),
      ),
    );
  }
}
