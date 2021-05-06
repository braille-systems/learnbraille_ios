import 'package:auto_size_text/auto_size_text.dart';
import 'package:braille_abc/components/bottom_bar_widget.dart';
import 'package:braille_abc/models/app_model.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class PositionWidget extends StatefulWidget {
  final String name;
  final int value;

  PositionWidget({this.name, this.value});

  @override
  State<PositionWidget> createState() => _PositionWidget();
}

class _PositionWidget extends State<PositionWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: ScreenParams.height(2, context), right: ScreenParams.height(2, context)),
            height: ScreenParams.height(4, context),
            child: MergeSemantics(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    widget.name,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: AppColors.symbolText),
                  ),
                  AutoSizeText(
                    widget.value.toString(),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: AppColors.symbolText),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: ScreenParams.width(1, context),
            thickness: 1.0,
            color: AppColors.divider,
          ),
        ],
    );
  }
}

@immutable
class ResultsInfoWidget extends StatefulWidget {
  final ResultsInfo results;

  const ResultsInfoWidget({@required this.results});

  @override
  State<ResultsInfoWidget> createState() => _ResultsInfoWidget();
}

class _ResultsInfoWidget extends State<ResultsInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: SemanticNames.getName(SemanticsType.Results),
      child: Container(
        height: 40,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: ScreenParams.width(10, context),
              child: Semantics(
                label: widget.results.getResultsInfo(ResultsPositions.GeneralInfo).name,
                child: AutoSizeText(
                  widget.results.getResultsInfo(ResultsPositions.GeneralInfo).name,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400, color: AppColors.symbolText),
                ),
              ),
            ),
            Divider(
              height: ScreenParams.width(1, context),
              thickness: 2.0,
              color: AppColors.divider,
            ),
            for (var position in widget.results.getDetailPositionsPool())
              PositionWidget(
                name: widget.results.getResultsInfo(position).name,
                value: widget.results.getResultsInfo(position).value,
              ),
          ],
        ),
      ),
    );
  }
}

@immutable
class BackButtonWidget extends StatefulWidget {
  @override
  State<BackButtonWidget> createState() => _BackButtonWidget();
}

class _BackButtonWidget extends State<BackButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppDecorations.navigationButton,
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(
                builder: (BuildContext context) => AppModel.navigationScreens[navigation.PracticeScreen]),
            (Route<dynamic> route) => false);
        scakey.currentState.onItemTapped(0);
        scakey.currentState.displayTapBar(true);
      },
      child: Align(
        alignment: Alignment.center,
        child: AutoSizeText(
          SemanticNames.getName(SemanticsType.BackToMainMenu),
          style: TextStyle(
            fontSize: 22.0,
            color: AppColors.second,
            shadows: <Shadow>[Styles.buildButtonShadow(), for (var stroke in Styles.buildStroke(0.25)) stroke],
          ),
        ),
      ),
    );
  }
}
