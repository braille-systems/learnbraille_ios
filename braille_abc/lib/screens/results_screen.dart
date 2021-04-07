import 'package:braille_abc/components/navigation_bar_widget.dart';
import 'package:braille_abc/components/results_info_widget.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:braille_abc/models/screen_model.dart';
import 'package:braille_abc/shared/non_swipeable.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class ResultsScreen extends NavigationScreen {
  const ResultsScreen({Key key, Widget helpPage, Widget previousPage})
      : super(key: key, helpPage: helpPage, previousPage: previousPage);

  @override
  Widget build(BuildContext context) {
    return nonSwipeable(
      context,
      CupertinoPageScaffold(
        navigationBar: NavigationBar(
          currentPage: this,
          title: ScreenNames.getName(ScreenType.Results),
        ),
        child: SafeArea(
          minimum: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: ScreenParams.height(4, context),
              ),
              Container(
                height: ScreenParams.heightIOS14(80, context),
                child: ResultsInfoWidget(results: ResultsInfo(PracticeResults.getResults())),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 48,
                child: BackButtonWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
