import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/components/practice_button_widget.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/shared/non_swipeable.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:flutter/material.dart';

@immutable
class PracticeScreen extends NavigationScreen {
  const PracticeScreen({
    Key key,
    Widget helpPage,
    Widget previousPage,
  }) : super(key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    Practice.updatePool();
    return nonSwipeable(
      context,
      CupertinoPageScaffold(
        navigationBar: NavigationBar(
          currentPage: this,
          title: ScreenNames.getName(ScreenType.Practice),
        ),
        child: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 20),
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
                    child: ListView(
                      children: <Widget>[
                        for (var practiceButton in AppModel.practiceButtons)
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 2),
                            child: PracticeButtonWidget(
                              practiceButton: practiceButton,
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 48,
                    child: ValueListenableBuilder<bool>(
                      valueListenable: Practice.isNotEmpty,
                      builder: (context, value, child){
                        return ContinueButtonWidget();
                      }
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
