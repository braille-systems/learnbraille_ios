import 'package:auto_size_text/auto_size_text.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:braille_abc/screens/home_screen.dart';
import 'package:braille_abc/screens/practice_screen.dart';
import 'package:braille_abc/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      label: 'Резулльтаты',
      child: Container(
        height: 40,
        width: double.infinity,
        color: Colors.redAccent,
        child: AutoSizeText(
          widget.results.getResultsInfo(ResultsPositions.StepCounter).name +
              widget.results.getResultsInfo(ResultsPositions.CorrectAnswers).name,
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
    return Semantics(
      label: SemanticNames.getName(SemanticsType.BackToMainMenu),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.first,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(builder: (BuildContext context) => PracticeScreen()), (Route<dynamic> route) => false);
        },
        child: Align(
          alignment: Alignment.center,
          child: AutoSizeText(
            SemanticNames.getName(SemanticsType.BackToMainMenu),
            style: TextStyle(fontSize: 22.0, color: AppColors.symbolText),
          ),
        ),
      ),
    );
  }
}
