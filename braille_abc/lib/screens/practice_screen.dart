import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/components/practice_button_widget.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:braille_abc/models/app_names.dart';

@immutable
class PracticeScreen extends NavigationScreen {
  const PracticeScreen({
    Key key,
    final Widget helpPage,
    final Widget previousPage,
  }) : super(key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    Practice.updatePool();
    return CupertinoPageScaffold(
      navigationBar: NavigationBar(
        currentPage: this,
        title: ScreenNames.getName(ScreenType.Practice),
      ),
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenParams.height(4, context),
            ),
            Column(
              children: [
                Container(
                  height: ScreenParams.heightIOS14(80, context),
                  child: GridView.count(
                    crossAxisCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    mainAxisSpacing: ScreenParams.width(4, context),
                    crossAxisSpacing: ScreenParams.height(4, context),
                    children: <Widget>[
                      for (var i = 0; i < AppModel.practiceButtons.length; ++i)
                        PracticeButtonWidget(
                          practiceButton: AppModel.practiceButtons[i],
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
