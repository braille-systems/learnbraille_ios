import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/components/practice_button_widget.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import '../models/menu_button.dart';

//TODO: Replace this class to other module. Mb remove static.
class Practice {
  static List<String> _pool = [];

  static void addSymbolGroup(String groupName) {
    _pool.add(groupName);
  }
  static void removeSymbolGroup(String groupName) {
    _pool.remove(groupName);
  }
  static List<String> getPool() {
    return _pool;
  }
  static void updatePool() {
    _pool.clear();
  }
}

class PracticeScreen extends NavigationScreen {
  const PracticeScreen({
    Key key,
    Widget helpPage,
    Widget previousPage,
  }) : super(key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: NavigationBar(
        currentPage: this,
        title: "Практика",
      ),
      child: SafeArea(
        minimum: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenParams.height(4, context),
            ),
            Column(
              children: [
                Container(
                  height: ScreenParams.heightIOS14(72, context),
                  child: GridView.count(
                    crossAxisCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    mainAxisSpacing: ScreenParams.width(4, context),
                    crossAxisSpacing: ScreenParams.height(4, context),
                    children: <Widget>[
                      for (var i = 0; i < AppModel.practiceButtons.length; ++i)
                        PracticeButtonWidget(
                          practiceButton: MenuButton(
                            name: AppModel.practiceButtons[i].name,
                            icon: AppModel.practiceButtons[i].icon,
                          ),
                        ),
                    ],
                  ),
                ),
                Container(
                  height: 48,
                  child: ContinueButtonWidget(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
