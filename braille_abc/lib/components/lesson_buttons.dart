import 'package:braille_abc/models/app_icons.dart';
import 'package:braille_abc/models/app_names.dart';
import 'package:braille_abc/models/study_model.dart';
import 'package:braille_abc/shared/screen_params.dart';
import 'package:braille_abc/symbol/struct_symbol.dart';
import 'package:braille_abc/models/practice_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:braille_abc/style.dart';
import 'package:braille_abc/models/lesson_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum lessonButtonType {
  backward,
  forward,
}

class BackForthButton extends StatelessWidget {
  final lessonButtonType type;
  final Symbol symbol;

  const BackForthButton({Key key, @required this.type, @required this.symbol}) : super(key: key);

  bool isForward() {
    return type == lessonButtonType.forward;
  }

  bool isBackward() {
    return type == lessonButtonType.backward;
  }

  @override
  Widget build(BuildContext context) {
    bool navigate = false;
    double _angle = 0;
    if (type == lessonButtonType.backward) {
      _angle = pi;
    }
    return Transform.rotate(
      angle: _angle,
      child: ElevatedButton(
        style: AppDecorations.nextButton,
        onPressed: () async {
          if (isForward()) {
            // obtain shared preferences
            SharedPreferences prefs = await SharedPreferences.getInstance();// set value
            await prefs.setInt(LessonNums.getName(lessonNumber.parrentLessonNum), StudyModel.curLessonPart.parentNumber);
            await prefs.setInt(LessonNums.getName(lessonNumber.lessonNum), StudyModel.curLessonPart.number);
            //print(StudyModel.curLessonPart.number);
            //print(StudyModel.curLessonLength);
            if(StudyModel.curLessonPart.number == StudyModel.curLessonLength){
              await prefs.setInt(LessonNums.getName(lessonNumber.parrentLessonNum), StudyModel.curLessonPart.parentNumber + 1);
            }

            if (StudyModel.currentLessonType == lessonType.practice) {
              if (PracticeResults.checkAnswer(symbol.getDotsInfo())) {
                navigate = StudyModel.incLessonPartIndex();
              }
            } else {
              navigate = StudyModel.incLessonPartIndex();
            }
          } else if (isBackward()) {
            navigate = StudyModel.decLessonPartIndex();
          }
          if (navigate) {
            await Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => StudyModel.curLessonPart.build(context),
              ),
            );
          }
        },
        child: Icon(
          AppIcon.getIcon(AppIcons.ContinueButton),
          size: ScreenParams.width(10, context),
          color: AppColors.sideIcon,
          semanticLabel: SemanticNames.getName(SemanticsType.Continue),
        ),
      ),
    );
  }
}

Column buildBackForthButton(BuildContext context, lessonButtonType type, Symbol symbol) {
  return Column(
    children: [
      symbol == null
          ? AppDecorations.getBackFortButtonPaddingTextScreen(context)
          : AppDecorations.getBackFortButtonPaddingLetterScreen(context),
      SizedBox(
        height: ScreenParams.height(Sizes.getBackFortButtonSize().height, context),
        width: ScreenParams.width(Sizes.getBackFortButtonSize().width, context),
        child: Semantics(
          label: SemanticNames.getName(SemanticsType.BackForthButton),
          child: ExcludeSemantics(
            child: BackForthButton(
              type: type,
              symbol: symbol,
            ),
          ),
        ),
      ),
    ],
  );
}
